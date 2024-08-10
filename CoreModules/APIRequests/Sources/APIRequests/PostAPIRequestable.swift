import Foundation
import APIClient
/// APIのPostリクエスト定義
protocol PostRequestable: APIClient {
    associatedtype Request: Encodable
    var header: APIRequestHeader<Request> { get }
}

extension PostRequestable {
    static var httpMethod: HttpMethod {
        .post
    }
    func request() async -> APIResult<Response> {
        let httpBody: Data
        do {
            httpBody = try JSONEncoder().encode(header)
        }
        catch {
            return APIResult(error:.parseError)
        }
        return await self.request(httpBody: httpBody)
    }
}
