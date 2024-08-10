import Foundation
import UIKit
/// アプリ全体の設定値
public enum AppConfig {
    /// APIのURLの前半部分
    static public var apiURLPrefix: String {
        Bundle.main.object(forInfoDictionaryKey: "API_URL_PREFIX") as! String
    }
    /// アプリ名
    static public var applicationName: String {
        Bundle.main.object(forInfoDictionaryKey: "CFBundleDisplayName") as! String
    }
    /// アプリバージョン
    static public var applicationVersion: String {
        Bundle.main.object(
            forInfoDictionaryKey: "CFBundleShortVersionString"
        ) as! String
    }
    /// 端末のOSバージョン
    static public var deviceVersion: String {
        UIDevice.current.systemVersion
    }
    /// 端末ID
    static public var terminalID: String = ""
    /// アプリケーションID
    static public let applicationID: String = ""
}
