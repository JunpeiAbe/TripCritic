import Foundation
import Models
/// ユーザー認証APIのレスポンス
struct AuthLoginResponse: Decodable {
    let status: APIStatus
    let data: Inner?
    
    struct Inner: Decodable {
        let token: String
    }
}
