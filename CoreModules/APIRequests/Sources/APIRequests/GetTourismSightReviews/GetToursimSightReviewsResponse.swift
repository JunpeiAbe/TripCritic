import Foundation
import Models
/// 観光スポットレビュー一覧取得APIのレスポンス
struct GetToursimSightReviewsResponse: Decodable {
    let status: APIStatus
    let data: Inner?
    
    struct Inner: Decodable {
        let token: String
        let lastUpdateDate: String
        let allSearchCount: Int
        let reviewList: [Review]?
        
        enum CodingKeys: String, CodingKey {
            case token
            case lastUpdateDate = "last_update_date"
            case allSearchCount = "all_search_count"
            case reviewList = "review_list"
        }
    }
}
