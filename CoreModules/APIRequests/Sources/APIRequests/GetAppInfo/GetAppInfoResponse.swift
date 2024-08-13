import Foundation
import Models
/// アプリ情報取得APIのレスポンス
public struct GetAppInfoResponse: Decodable {
    let status: APIStatus
    let data: Inner?
    
    struct Inner: Decodable {
        let maintenanceFlag: String?
        let minAppVersion: String?
        
        enum CodingKeys: String, CodingKey {
            case maintenanceFlag = "maintenance_flag"
            case minAppVersion = "min_app_version"
        }
    }
}
