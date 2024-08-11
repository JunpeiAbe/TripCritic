import Foundation
/// 観光スポットレビュー詳細取得APIのリクエスト
struct GetTourismSightReviewDetailRequest: Encodable {
    /// トークン
    let token: String
    /// レビューID
    let reviewID: Int
    /// ユーザーID
    let mailAddress: String
    
    enum CodingKeys: String, CodingKey {
        case token
        case reviewID = "review_id"
        case mailAddress = "mail_address"
    }
}
