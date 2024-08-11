import Foundation
/// 観光スポットレビュー投稿API
struct PostToursimSightReviewAPI: PostRequestable {
    var header: APIRequestHeader<PostToursimSightReviewRequest>
    
    typealias Request = PostToursimSightReviewRequest
    
    typealias Response = PostToursimSightReviewResponse
    
    var path: String = "PostToursimSightReview"
}
