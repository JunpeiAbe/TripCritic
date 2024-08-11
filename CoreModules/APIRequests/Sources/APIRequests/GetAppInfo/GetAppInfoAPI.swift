import Foundation
/// アプリ情報取得API
struct GetAppInfoAPI: GetRequestable {
    typealias Response = GetAppInfoResponse
    
    var path: String = "AppInfo"
}
