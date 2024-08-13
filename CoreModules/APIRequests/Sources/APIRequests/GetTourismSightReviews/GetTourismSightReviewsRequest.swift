import Foundation
/// 観光スポットレビュー一覧取得APIのリクエスト
public struct GetTourismSightReviewsRequest: Encodable {
    /// トークン
    let token: String
    /// 観光スポットID
    let tourismSightID: Int
    /// ユーザーID
    let mailAddress: String
    /// 最新更新日時
    let lastUpdateDate: String?
    /// 開始件数
    let startListCount: Int
    /// 取得件数
    let getListCount: Int
    /// 全検索件数
    let allSearchCount: Int
    
    enum CodingKeys: String, CodingKey {
        case token
        case tourismSightID = "tourism_sight_id"
        case mailAddress = "mail_address"
        case lastUpdateDate = "last_update_date"
        case startListCount = "start_list_count"
        case getListCount = "get_list_count"
        case allSearchCount = "all_search_count"
    }
    
    public init(
        token: String,
        tourismSightID: Int,
        mailAddress: String,
        lastUpdateDate: String?,
        startListCount: Int,
        getListCount: Int,
        allSearchCount: Int
    ) {
        self.token = token
        self.tourismSightID = tourismSightID
        self.mailAddress = mailAddress
        self.lastUpdateDate = lastUpdateDate
        self.startListCount = startListCount
        self.getListCount = getListCount
        self.allSearchCount = allSearchCount
    }
}
