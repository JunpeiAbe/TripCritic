import Foundation
import Models
/// プロフィール取得APIのレスポンス
public struct GetProfileResponse: Decodable {
    let status: APIStatus
    let data: Inner?
    
    struct Inner: Decodable {
        let token: String?
        let userName: String
        let profileImageURL: String?
        let job: Job
        let sex: Sex
        let birthday: String
        let message: String?
        
        enum CodingKeys: String, CodingKey {
            case token
            case userName = "user_name"
            case profileImageURL = "profile_image_url"
            case job
            case sex
            case birthday
            case message
        }
    }
}
