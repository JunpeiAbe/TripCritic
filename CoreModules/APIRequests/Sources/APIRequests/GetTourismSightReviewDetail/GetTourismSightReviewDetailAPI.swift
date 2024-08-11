import Foundation
/// 観光スポットレビュー詳細取得API
struct GetTourismSightReviewDetailAPI: PostRequestable {
    var header: APIRequestHeader<GetTourismSightReviewDetailRequest>
    
    typealias Request = GetTourismSightReviewDetailRequest
    
    typealias Response = GetTourismSightReviewDetailResponse
    
    var path: String = "GetTourismSightReviewDetail"
}
