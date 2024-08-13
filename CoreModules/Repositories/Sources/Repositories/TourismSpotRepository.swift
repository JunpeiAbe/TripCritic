import Foundation
import APIClient
import APIRequests
/// 観光スポットリポジトリ
public protocol TourismSightRepositoryProtocol {
    func fetchTourismSightInfo(_ request: GetTourismSightInfoRequest) async -> APIResult<GetTourismSightInfoResponse>
    func fetchTourismSightReviews(_ request: GetTourismSightReviewsRequest) async -> APIResult<GetTourismSightReviewsResponse>
    func fetchTourismSightReviewDetail(_ request: GetTourismSightReviewDetailRequest) async -> APIResult<GetTourismSightReviewDetailResponse>
    func postTourismSightReview(_ request: PostTourismSightReviewRequest) async -> APIResult<PostTourismSightReviewResponse>
}

public class TourismSightRepository: TourismSightRepositoryProtocol {
    public init() {}
    
    public func fetchTourismSightInfo(_ request: GetTourismSightInfoRequest) async -> APIResult<GetTourismSightInfoResponse> {
        let api = GetTourismSightInfoAPI()
        return await api.post(request)
    }
    
    public func fetchTourismSightReviews(_ request: GetTourismSightReviewsRequest) async -> APIResult<GetTourismSightReviewsResponse> {
        let api = GetTourismSightReviewsAPI()
        return await api.post(request)
    }
    
    public func fetchTourismSightReviewDetail(_ request: GetTourismSightReviewDetailRequest) async -> APIResult<GetTourismSightReviewDetailResponse> {
        let api = GetTourismSightReviewDetailAPI()
        return await api.post(request)
    }
    
    public func postTourismSightReview(_ request: PostTourismSightReviewRequest) async -> APIResult<PostTourismSightReviewResponse> {
        let api = PostTourismSightReviewAPI()
        return await api.post(request)
    }
}
