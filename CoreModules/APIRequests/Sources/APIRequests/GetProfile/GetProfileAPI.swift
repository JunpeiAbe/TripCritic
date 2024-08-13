import Foundation
/// プロフィール取得
public struct GetProfileAPI: PostRequestable {
    public typealias Request = GetProfileRequest
    
    public typealias Response = GetProfileResponse
    
    public let path: String = "GetProfile"
    
    public init() {}
}
