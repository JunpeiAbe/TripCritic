import Foundation
import Models
/// 観光スポットレビュー投稿APIのレスポンス
public struct PostTourismSightReviewResponse: Decodable {
    let status: APIStatus
    let data: Inner?
    
    struct Inner: Decodable {
        let token: String
    }
}
