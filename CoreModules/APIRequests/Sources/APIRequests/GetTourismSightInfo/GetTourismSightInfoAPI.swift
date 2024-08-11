import Foundation
/// 観光スポット情報取得API
struct GetTourismSightInfoAPI: PostRequestable {
    var header: APIRequestHeader<GetTourismSightInfoRequest>
    
    typealias Request = GetTourismSightInfoRequest
    
    typealias Response = GetTourismSightInfoResponse
    
    var path: String = "GetTourismSightInfo"
}
