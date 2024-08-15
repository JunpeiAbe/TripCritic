import Foundation
import CoreLocation

/// 位置情報取得
public protocol LocationGetable: AnyObject {
    var locationManager: LocationManager { get }
    func didUpdateLocation(_ location: CLLocationCoordinate2D)
    func didFailWithError(_ error: Error)
    func didChangeAuthorizationDenied()
}

public class LocationManager: NSObject {
    private let locationManager = CLLocationManager()
    public weak var delegate: LocationGetable?
    public var currentLocation: CLLocationCoordinate2D?
    
    public override init() {
        super.init()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }
    
    /// 位置情報のリクエスト
    public func requestLocation() {
        switch self.locationManager.authorizationStatus {
            
        case .notDetermined:
            self.locationManager.requestWhenInUseAuthorization()
        case .restricted, .denied:
            /// 実装元で設定画面に遷移するダイアログなどを表示する
            self.delegate?.didChangeAuthorizationDenied()
        case .authorizedAlways, .authorizedWhenInUse:
            self.locationManager.startUpdatingLocation()
        default:
            break
        }
    }
}

extension LocationManager: CLLocationManagerDelegate {
    /// 権限変更時
    public func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        switch self.locationManager.authorizationStatus {
        case .restricted, .denied:
            /// 呼び出し元で設定画面に遷移するダイアログなどを表示する
            self.delegate?.didChangeAuthorizationDenied()
        case .authorizedAlways, .authorizedWhenInUse:
            self.locationManager.startUpdatingLocation()
        default:
            break
        }
    }
    /// 位置情報取得失敗時
    public func locationManager(_ manager: CLLocationManager, didFailWithError error: any Error) {
        /// 呼び出し元で任意の処理を行う
        delegate?.didFailWithError(error)
    }
    /// 位置情報取得成功時
    public func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            currentLocation = location.coordinate
            delegate?.didUpdateLocation(location.coordinate)
            locationManager.stopUpdatingLocation() // 一度取得したら停止する場合
        }
    }
}

/// メモ
/*
 位置情報の取得でバックグラウンドも使用する場合
 1. info.plistの設定
 バックグラウンドで位置情報を取得するためには、Info.plistに以下のキーを追加する必要があります。
 NSLocationAlwaysUsageDescription: 常に位置情報を使用する場合の説明。
 NSLocationWhenInUseUsageDescription: アプリ使用中に位置情報を使用する場合の説明。
 NSLocationAlwaysAndWhenInUseUsageDescription: 両方の場合に使用する場合の説明（iOS 11以降）。
 UIBackgroundModes: location を含めることで、バックグラウンドでも位置情報サービスが許可される。
 
 2. CLLocationManagerの設定
 locationManager.allowsBackgroundLocationUpdates = true // バックグラウンドでの更新を許可
 locationManager.pausesLocationUpdatesAutomatically = false // 自動停止を無効にする
 case .notDetermined: locationManager.requestAlwaysAuthorization() // 常に位置情報を取得する権限をリクエスト
 
 3. 位置情報取得の頻度調整
 バックグラウンドでの位置情報取得が高頻度で行われると、バッテリーの消耗が激しくなります。そのため、必要に応じて位置情報取得の精度や頻度を調整することが推奨されます。
 desiredAccuracy: 取得精度を設定します。kCLLocationAccuracyBestは最も高い精度ですが、バッテリー消費も大きくなります。バックグラウンドではkCLLocationAccuracyHundredMetersなど、適度な精度を選ぶのが一般的です。
 distanceFilter: 更新間隔（移動距離）を設定します。これにより、位置情報の更新頻度を制御できます。たとえば、distanceFilter = 100に設定すると、100メートル移動するごとに位置情報が更新されます。
 */
