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
