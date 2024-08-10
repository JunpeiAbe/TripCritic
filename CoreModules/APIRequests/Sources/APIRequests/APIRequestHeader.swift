import Foundation
import Configuration
/// APIのヘッダ情報(ボディに含める)
struct APIRequestHeader<Request: Encodable>: Encodable {
    /// 端末ID
    var terminalID: String
    /// アプリバージョン
    var applicationVersion: String
    /// OSバージョン
    var osVersion: String
    /// アプリID
    var applicationID: String
    /// リクエスト
    var request: Request
    
    init(
        terminalID: String = AppConfig.terminalID,
        applicationVersion: String = AppConfig.applicationVersion,
        osVersion: String = AppConfig.deviceVersion,
        applicationID: String = AppConfig.applicationID,
        request: Request
    ) {
        self.terminalID = terminalID
        self.applicationVersion = applicationVersion
        self.osVersion = osVersion
        self.applicationID = applicationID
        self.request = request
    }
    
    enum CodingKeys: String, CodingKey {
        case terminalId = "terminal_id"
        case applicationVersion = "application_version"
        case osVersion = "os_version"
        case applicationId = "application_id"
        case request
    }
}
