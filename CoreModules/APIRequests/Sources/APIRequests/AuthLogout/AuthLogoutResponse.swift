import Foundation
import Models
/// ユーザーログアウトAPIのレスポンス
public struct AuthLogoutResponse: Decodable {
    let status: APIStatus
    let data: Inner?
    
    struct Inner: Decodable {
        let token: String
    }
}
