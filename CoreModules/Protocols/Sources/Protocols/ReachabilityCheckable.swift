import  SystemConfiguration
/// ネットワーク接続可否判定
public protocol ReachabilityCheckable {}

public extension ReachabilityCheckable {
    /// 該当のネットワークに接続可能か確認する
    /// - Parameter path: ネットワークのパス (URLなど)
    /// - Returns: 接続可能:true
    func checkReachablity(_ path: String) -> Bool {
        guard let reachability = SCNetworkReachabilityCreateWithName(nil, path) else {
            return false
        }
        var flags = SCNetworkReachabilityFlags.connectionAutomatic
        guard SCNetworkReachabilityGetFlags(reachability, &flags) else {
            return false
        }
        let isReachable = (flags.rawValue & UInt32(kSCNetworkFlagsReachable)) != 0
        let needConnection = (flags.rawValue & UInt32(kSCNetworkFlagsConnectionRequired)) != 0
        return isReachable && !(needConnection)
    }
}
