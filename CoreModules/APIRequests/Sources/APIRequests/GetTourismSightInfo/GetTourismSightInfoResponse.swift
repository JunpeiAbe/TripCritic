import Foundation
import Models
/// 観光スポット情報取得APIのレスポンス
public struct GetTourismSightInfoResponse: Decodable {
    let status: APIStatus
    let data: Inner?
    
    struct Inner: Decodable {
        let token: String?
        let tourismSightInfoList: [TourismSightInfo]?
        
        enum CodingKeys: String, CodingKey {
            case token
            case tourismSightInfoList = "tourism_sight_info_list"
        }
    }
}


