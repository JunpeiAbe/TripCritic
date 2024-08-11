import Foundation
/// ユーザーログアウトAPIのリクエスト
struct AuthLogoutRequest: Encodable {
    /// ユーザーID
    let mailAddress: String
    /// トークン
    let token: String
    
    enum CodingKeys: String, CodingKey {
        case mailAddress = "mail_address"
        case token
    }
}
