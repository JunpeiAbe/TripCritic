import Foundation
/// ユーザーログアウトAPI
public struct AuthLogoutAPI: PostRequestable {
    public typealias Request = AuthLogoutRequest
    
    public typealias Response = AuthLogoutResponse
    
    public let path: String = "AuthLogout"
    
    public init() {}
}
