import Foundation
/// プロフィール取得APIのリクエスト
public struct GetProfileRequest: Encodable {
    /// ユーザーID
    let mailAddress: String
    /// トークン
    let token: String
    
    enum CodingKeys: String, CodingKey {
        case mailAddress = "mail_address"
        case token
    }
    
    public init(
        mailAddress: String,
        token: String
    ) {
        self.mailAddress = mailAddress
        self.token = token
    }
}
