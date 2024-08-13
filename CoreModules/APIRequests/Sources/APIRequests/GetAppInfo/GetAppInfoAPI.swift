import Foundation
/// アプリ情報取得API
public struct GetAppInfoAPI: GetRequestable {
    public typealias Response = GetAppInfoResponse
    
    public let path: String = "AppInfo"
    
    public init() {}
}
