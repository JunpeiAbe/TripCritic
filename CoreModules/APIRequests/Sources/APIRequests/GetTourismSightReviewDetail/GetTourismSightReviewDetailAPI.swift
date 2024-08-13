import Foundation
/// 観光スポットレビュー詳細取得API
public struct GetTourismSightReviewDetailAPI: PostRequestable {
    public typealias Request = GetTourismSightReviewDetailRequest
    
    public typealias Response = GetTourismSightReviewDetailResponse
    
    public let path: String = "GetTourismSightReviewDetail"
    
    public init() {}
}
