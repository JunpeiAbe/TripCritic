import Foundation
/// プロフィール更新API
struct UpdateProfileAPI: PostRequestable {
    var header: APIRequestHeader<UpdateProfileRequest>
    
    typealias Request = UpdateProfileRequest
    
    typealias Response = UpdateProfileResponse
    
    var path: String = "UpdateProfile"
}
