import Foundation
/// 観光スポットレビュー一覧取得API
public struct GetTourismSightReviewsAPI: PostRequestable {
    public typealias Request = GetTourismSightReviewsRequest
    
    public typealias Response = GetTourismSightReviewsResponse
    
    public let path: String = "GetToursimSightReviews"
    
    public init() {}
}
