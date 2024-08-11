import Foundation
/// 観光スポットレビュー一覧取得API
struct GetToursimSightReviewsAPI: PostRequestable {
    var header: APIRequestHeader<GetToursimSightReviewsRequest>
    
    typealias Request = GetToursimSightReviewsRequest
    
    typealias Response = GetToursimSightReviewsResponse
    
    var path: String = "GetToursimSightReviews"
}
