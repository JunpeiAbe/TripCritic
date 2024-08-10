import Foundation
import APIClient
/// APIのGetリクエスト定義
protocol GetRequestable: APIClient {}

extension GetRequestable {
    static var httpMethod: HttpMethod {
        .get
    }
    func request() async -> APIResult<Response> {
        await self.request(httpBody: nil)
    }
}
