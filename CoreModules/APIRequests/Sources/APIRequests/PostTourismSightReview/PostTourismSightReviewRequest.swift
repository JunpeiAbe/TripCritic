import Foundation
/// 観光スポットレビュー投稿APIのリクエスト
public struct PostTourismSightReviewRequest: Encodable {
    /// トークン
    let token: String
    /// ユーザーID
    let mailAddress: String
    /// 観光スポットID
    let tourismSightID: Int
    /// レビューレート
    let rating: Double
    /// レビューコメント
    let comment: String
    /// ロケーション画像
    let locationPhotoURL: String?
    
    enum CodingKeys: String, CodingKey {
        case token
        case mailAddress = "mail_address"
        case tourismSightID = "tourism_sight_id"
        case rating
        case comment
        case locationPhotoURL = "location_photo_url"
    }
    
    public init(
        token: String,
        mailAddress: String,
        tourismSightID: Int,
        rating: Double,
        comment: String,
        locationPhotoURL: String?
    ) {
        self.token = token
        self.mailAddress = mailAddress
        self.tourismSightID = tourismSightID
        self.rating = rating
        self.comment = comment
        self.locationPhotoURL = locationPhotoURL
    }
}
