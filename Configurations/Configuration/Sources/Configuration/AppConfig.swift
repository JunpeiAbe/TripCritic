import Foundation
/// アプリ全体の設定値
public enum AppConfig {
    /// APIのURLの前半部分
    static var apiURLPrefix: String {
        Bundle.main.object(forInfoDictionaryKey: "API_URL_PREFIX") as! String
    }
    /// アプリ名
    static var applicationName: String {
        Bundle.main.object(forInfoDictionaryKey: "CFBundleDisplayName") as! String
    }
    /// アプリバージョン
    static var applicationVersion: String {
        Bundle.main.object(
            forInfoDictionaryKey: "CFBundleShortVersionString"
        ) as! String
    }
}
