import Foundation
/// 観光スポットレビュー投稿API
public struct PostTourismSightReviewAPI: PostRequestable {
    public typealias Request = PostTourismSightReviewRequest
    
    public typealias Response = PostTourismSightReviewResponse
    
    public let path: String = "PostToursimSightReview"
    
    public init() {}
}
