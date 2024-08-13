import Foundation
/// 観光スポット情報取得API
public struct GetTourismSightInfoRequest: Encodable {
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
    
    public init(
        token: String,
        latitude: Double,
        longitude: Double,
        radius: Int,
        mailAddress: String
    ) {
        self.token = token
        self.latitude = latitude
        self.longitude = longitude
        self.radius = radius
        self.mailAddress = mailAddress
    }
}
