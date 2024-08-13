import Foundation
/// ユーザー登録API
public struct AuthRegisterAPI: PostRequestable {
    public typealias Request = AuthRegisterRequest
    
    public typealias Response = AuthRegisterResponse
    
    public let path: String = "AuthRegister"
    
    public init() {}
}
