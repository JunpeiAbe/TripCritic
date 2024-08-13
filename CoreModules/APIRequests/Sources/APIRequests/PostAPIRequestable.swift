import Foundation
import APIClient
/// APIのPostリクエスト定義
public protocol PostRequestable: APIClient {
    associatedtype Request: Encodable
}

public extension PostRequestable {
    var httpMethod: HttpMethod {
        .post
    }
    func post(_ request: Request) async -> APIResult<Response> {
        let header = APIRequestHeader(request: request)
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
