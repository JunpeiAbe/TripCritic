import Foundation
import APIClient
import APIRequests
/// 認証リポジトリ
public protocol AuthRepositoryProtocol {
    func authLogin(_ request: AuthLoginRequest) async -> APIResult<AuthLoginResponse>
    func authLogout(_ request: AuthLogoutRequest) async -> APIResult<AuthLogoutResponse>
    func authRegister(_ request: AuthRegisterRequest) async -> APIResult<AuthRegisterResponse>
}

public class AuthRepository: AuthRepositoryProtocol {
    public init() {}
    
    public func authLogin(_ request: AuthLoginRequest) async -> APIResult<AuthLoginResponse> {
        let api = AuthLoginAPI()
        return await api.post(request)
    }
    public func authLogout(_ request: AuthLogoutRequest) async -> APIResult<AuthLogoutResponse> {
        let api = AuthLogoutAPI()
        return await api.post(request)
    }
    public func authRegister(_ request: AuthRegisterRequest) async -> APIResult<AuthRegisterResponse> {
        let api = AuthRegisterAPI()
        return await api.post(request)
    }
}

