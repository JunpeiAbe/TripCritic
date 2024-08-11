import Foundation
import Models
/// 観光スポットレビュー詳細取得APIのレスポンス
struct GetTourismSightReviewDetailResponse: Decodable {
    let status: APIStatus
    let data: Inner?
    
    struct Inner: Decodable {
        let token: String
        let user: User
        let rating: Double
        let comment: String
        let postDate: String
        let locationPhotoURL: String?
        
        enum CodingKeys: String, CodingKey {
            case token
            case user
            case rating
            case comment
            case postDate = "post_date"
            case locationPhotoURL = "location_photo_url"
        }
    }

    struct User: Decodable {
        let id: Int
        let name: String
        let profileImageURL: String?
        
        enum CodingKeys: String, CodingKey {
            case id
            case name
            case profileImageURL = "profile_image_url"
        }
    }
}


