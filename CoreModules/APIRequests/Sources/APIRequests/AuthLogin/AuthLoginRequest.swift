import Foundation
/// ユーザー認証APIのリクエスト
struct AuthLoginRequest: Encodable {
    /// ユーザーID
    let mailAddress: String
    /// パスワード
    let password: String?
    /// トークン
    let token: String?
    
    enum CodingKeys: String, CodingKey {
        case mailAddress = "mail_address"
        case password
        case token
    }
    /// 手動ログイン
    init(mailAddress: String, password: String) {
        self.mailAddress = mailAddress
        self.password = password
        self.token = nil
    }
    /// 自動ログイン
    init(mailAddress: String, token: String) {
        self.mailAddress = mailAddress
        self.password = nil
        self.token = token
    }
}
