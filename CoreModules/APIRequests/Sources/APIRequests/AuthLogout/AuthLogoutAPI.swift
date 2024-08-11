import Foundation
/// ユーザーログアウトAPI
struct AuthLogoutAPI: PostRequestable {
    var header: APIRequestHeader<AuthLogoutRequest>
    
    typealias Request = AuthLogoutRequest
    
    typealias Response = AuthLogoutResponse
    
    var path: String = "AuthLogout"
}
