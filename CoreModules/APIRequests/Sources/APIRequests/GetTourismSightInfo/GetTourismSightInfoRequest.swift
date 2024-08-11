import Foundation
/// 観光スポット情報取得API
struct GetTourismSightInfoRequest: Encodable {
    /// トークン
    let token: String
    /// 緯度
    let latitude: Double
    /// 軽度
    let longitude: Double
    /// 指定半径
    let radius: Int
    /// ユーザーID
    let mailAddress: String
    
    enum CodingKeys: String, CodingKey {
        case token
        case latitude
        case longitude
        case radius
        case mailAddress = "mail_address"
    }
}
