import Foundation
/// ユーザー認証API
struct AuthLoginAPI: PostRequestable {
    var header: APIRequestHeader<AuthLoginRequest>
    
    typealias Request = AuthLoginRequest
    
    typealias Response = AuthLoginResponse
    
    var path: String = "AuthLogin"
}
