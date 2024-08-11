import Foundation
import Models
/// プロフィール更新APIのリクエスト
struct UpdateProfileRequest: Encodable {
    /// ユーザーID
    let mailAddress: String
    /// トークン
    let token: String
    /// ユーザーネーム
    let userName: String
    /// プロフィール画像URL
    let profileImageURL: String?
    /// 職業
    let job: Job
    /// 性別
    let sex: Sex
    /// 誕生日
    let birthday: String
    /// メッセージ
    let message: String?
    
    enum CodingKeys: String, CodingKey {
        case mailAddress = "mail_address"
        case token
        case userName = "user_name"
        case profileImageURL = "profile_image_url"
        case job
        case sex
        case birthday
        case message
    }
}
