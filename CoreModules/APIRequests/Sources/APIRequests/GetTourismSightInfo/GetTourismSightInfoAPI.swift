import Foundation
/// 観光スポット情報取得API
public struct GetTourismSightInfoAPI: PostRequestable {
    public typealias Request = GetTourismSightInfoRequest
    
    public typealias Response = GetTourismSightInfoResponse
    
    public let path: String = "GetTourismSightInfo"
    
    public init() {}
}
