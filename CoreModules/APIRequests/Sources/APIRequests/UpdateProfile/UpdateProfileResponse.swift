import Foundation
import Models
/// プロフィール更新APIのレスポンス
public struct UpdateProfileResponse: Decodable {
    let status: APIStatus
    let data: Inner?
    
    struct Inner: Decodable {
        let token: String
    }
}
