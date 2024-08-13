import Foundation
import APIClient
/// APIのGetリクエスト定義
public protocol GetRequestable: APIClient {}

public extension GetRequestable {
    var httpMethod: HttpMethod {
        .get
    }
    func get() async -> APIResult<Response> {
        await self.request(httpBody: nil)
    }
}
