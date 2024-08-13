import Foundation
/// プロフィール更新API
public struct UpdateProfileAPI: PostRequestable {
    public typealias Request = UpdateProfileRequest
    
    public typealias Response = UpdateProfileResponse
    
    public let path: String = "UpdateProfile"
    
    public init() {}
}
