import Foundation
import Models
/// ユーザー登録APIのレスポンス
struct AuthRegisterResponse: Decodable {
    let status: APIStatus
    let data: Inner?
    
    struct Inner: Decodable {}
}
