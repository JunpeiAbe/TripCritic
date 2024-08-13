import Foundation
import APIClient
import APIRequests
/// アプリ情報取得リポジトリ
public protocol AppInfoRepositoryProtocol {
    func fetchAppInfo() async -> APIResult<GetAppInfoResponse>
}

public class AppInfoRepository: AppInfoRepositoryProtocol {
    public init() {}
    
    public func fetchAppInfo() async -> APIResult<GetAppInfoResponse> {
        let api = GetAppInfoAPI()
        return await api.get()
    }
}
