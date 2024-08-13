import Foundation
/// ユーザー認証API
public struct AuthLoginAPI: PostRequestable {
    public typealias Request = AuthLoginRequest
    
    public typealias Response = AuthLoginResponse
    
    public let path: String = "AuthLogin"
    
    public init() {}
}
