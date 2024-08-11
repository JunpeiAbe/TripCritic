import Foundation
/// プロフィール取得
struct GetProfileAPI: PostRequestable {
    var header: APIRequestHeader<GetProfileRequest>
    
    typealias Request = GetProfileRequest
    
    typealias Response = GetProfileResponse
    
    var path: String = "GetProfile"
}
