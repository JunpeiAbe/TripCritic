import Foundation
import Configuration
import Protocols
/// APIの共通定義
public protocol APIClient: ReachabilityCheckable, CipherProtocol {
    /// 返却データ
    associatedtype Response: Decodable
    /// ベースとなるURL
    var baseURL: URL { get }
    /// パス(URLの後半部分)
    var path: String { get }
    /// httpメソッド
    var httpMethod: HttpMethod { get }
}

public extension APIClient {
    /// ベースとなるURL
    var baseURL: URL {
        URL(string: AppConfig.apiURLPrefix)!
    }
    /// 接続先URL
    var url: URL? {
        URL(string: path, relativeTo: baseURL)
    }
    /// デバック時に使用するJSONファイル名
    var debugResultFileName: String {
        self.path.uppercased()
    }
    /// httpメソッド(デフォルトでpost)
    var httpMethod: HttpMethod {
        .post
    }
    
    func request(httpBody: Data?) async -> APIResult<Response> {
        guard let url = self.url else {
            return APIResult(error: .invalidURL)
        }
        /// 接続状態のチェック
        guard self.checkReachablity(url.absoluteString) else {
            return APIResult(error: .networkError)
        }
        /// 暗号化
        guard let httpBody = httpBody,
              let encryptedData = self.encrypt(data: httpBody, using: self.cryptKey),
              let encodedData = try? JSONEncoder().encode(encryptedData.ciphertext.base64EncodedString())
        else {
            return APIResult(error: .parseError)
        }
        var urlRequest = URLRequest(url: url)
        if self.httpMethod == .post {
            urlRequest.httpMethod = self.httpMethod.rawValue
            urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
            urlRequest.httpBody = encodedData
        }
        let config = URLSessionConfiguration.default
        config.requestCachePolicy = .reloadIgnoringLocalCacheData
        config.timeoutIntervalForRequest = 30
        config.timeoutIntervalForResource = 30
        
        let urlSession = URLSession(configuration: config)
        do {
            var (data, urlResponse) = try await urlSession.data(for: urlRequest)
            guard let urlResponse = urlResponse as? HTTPURLResponse
            else {
                return APIResult(error: .otherError)
            }
            guard urlResponse.statusCode == 200
            else {
                switch urlResponse.statusCode {
                case 400:
                    return APIResult(statusCode: 400, error: .responseError)
                case 404:
                    return APIResult(statusCode: 404, error: .responseError)
                case 500:
                    return APIResult(statusCode: 500, error: .responseError)
                default:
                    return APIResult(statusCode: urlResponse.statusCode, error: .otherError)
                }
            }
            var responseData: Data = data
            if self.httpMethod == .post {
                /// 復号化
                guard let decodedDataStr = try JSONDecoder().decode(String?.self, from: data),
                      let decodedData = Data(base64Encoded: decodedDataStr),
                      let decryptedData = self.decrypt(data: decodedData, using: self.cryptKey, nonce: encryptedData.nonce, tag: encryptedData.tag)
                else {
                    return APIResult(error: .parseError)
                }
                responseData = decryptedData
            }
        
            let response = try JSONDecoder().decode(Response.self, from: responseData)
            // TODO: トークンがある場合は更新する(追加で実装)
            return APIResult(statusCode: 200, response: response)
        }
        catch {
            let nsError = error as NSError
            if nsError.domain == NSURLErrorDomain,
               nsError.code == NSURLErrorTimedOut {
                // タイムアウト
                return APIResult(error: .timeout)
            }
            else {
                return APIResult(error: .otherError)
            }
        }
    }
}

public struct APIResult<Response> {
    /// ステータスコード
    var statusCode: Int?
    /// APIの返却データ
    var response: Response?
    /// APIエラー
    var error: APIError?
    
    public init(
        statusCode: Int? = nil,
        response: Response? = nil,
        error: APIError? = nil
    ) {
        self.statusCode = statusCode
        self.response = response
        self.error = error
    }
}

public enum APIError: Error {
    /// 不正なURL
    case invalidURL
    /// 通信エラー
    case networkError
    /// 通信タイムアウト
    case timeout
    /// レスポンスエラー
    case responseError
    /// decode失敗
    case parseError
    /// その他のエラー
    case otherError
}

public enum HttpMethod: String {
    case get = "GET"
    case post = "POST"
}


