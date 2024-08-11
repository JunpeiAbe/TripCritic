import Foundation
/// ユーザー登録API
struct AuthRegisterAPI: PostRequestable {
    var header: APIRequestHeader<AuthRegisterRequest>
    
    typealias Request = AuthRegisterRequest
    
    typealias Response = AuthLoginResponse
    
    var path: String = "AuthRegister"
}
