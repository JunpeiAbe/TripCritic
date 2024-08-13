import Foundation
import APIClient
import APIRequests
/// プロフィールリポジトリ
public protocol UserProfileRepositoryProtocol {
    func fetchUserProfile(_ request: GetProfileRequest) async -> APIResult<GetProfileResponse>
    func updateUserProfile(_ request: UpdateProfileRequest) async -> APIResult<UpdateProfileResponse>
}

public class UserProfileRepository: UserProfileRepositoryProtocol {
    public init() {}
    
    public func fetchUserProfile(_ request: GetProfileRequest) async -> APIResult<GetProfileResponse> {
        let api = GetProfileAPI()
        return await api.post(request)
    }
    
    public func updateUserProfile(_ request: UpdateProfileRequest) async -> APIResult<UpdateProfileResponse> {
        let api = UpdateProfileAPI()
        return await api.post(request)
    }
}
