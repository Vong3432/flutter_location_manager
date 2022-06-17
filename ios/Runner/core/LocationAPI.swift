//
//  LocationAPI.swift
//  Runner
//
//  Created by Vong Nyuksoon on 16/06/2022.
//

import Foundation
import Combine

class LocationAPIClass: NSObject, LocationAPI {
    let methodChannel: FlutterMethodChannel
    private(set) static var locationManager = LocationManager()
    private var cancellable = Set<AnyCancellable>()
    
    init(methodChannel: FlutterMethodChannel) {
        self.methodChannel = methodChannel
    }
    
    func listenLocationCoordinateWithError(_ error: AutoreleasingUnsafeMutablePointer<FlutterError?>) {
        LocationAPIClass.locationManager.startUpdating()
        LocationAPIClass.locationManager.$lastLocation
            .sink { [weak self] clLocation in
                guard let clLocation = clLocation else { return }
                
                var location: [String: Any] = [:]
                location["latitude"] = clLocation.coordinate.latitude
                location["longitude"] = clLocation.coordinate.longitude
                
                let toJSON = try? JSONSerialization.data(withJSONObject: location, options: [])
                
                guard let toJSON = toJSON, let decoded = String(data: toJSON, encoding: .utf8) else { return }
                self?.methodChannel.invokeMethod("location_coordinate_changed", arguments: decoded)
            }
            .store(in: &cancellable)
    }
    
    func stopListenLocationCoordinateWithError(_ error: AutoreleasingUnsafeMutablePointer<FlutterError?>) {
        LocationAPIClass.locationManager.stopUpdating()
    }
    
    
    func requestLocationPermissionWithError(_ error: AutoreleasingUnsafeMutablePointer<FlutterError?>) {
        LocationAPIClass.locationManager.requestPermission()
    }
    
    func getLocationStatusWithError(_ error: AutoreleasingUnsafeMutablePointer<FlutterError?>) -> LocationStatus? {
        let authorizationStatus = LocationAPIClass.locationManager.authorizationStatus
        var status = ""
        
        switch authorizationStatus {
        case .notDetermined:
            status = "Location access is not determined!"
            break
        case .restricted:
            status = "Location access is Restricted!"
            break
        case .denied:
            status = "Location access is denied!"
            break
        case .authorizedAlways:
            status = "Location access is always authorized!"
            break
        case .authorizedWhenInUse:
            status = "Location access is authorized when in use!"
            break
        @unknown default:
            status = "Location access is not determined!"
            break
        }
        
        return LocationStatus.make(withStatus: status)
    }
    
    func getLocationCoordWithError(_ error: AutoreleasingUnsafeMutablePointer<FlutterError?>) -> LocationCoordinate? {
        LocationAPIClass.locationManager.getCurrentLocation()
        
        guard let coord = LocationAPIClass.locationManager.lastLocation else {
            error.pointee = FlutterError(code: "", message: "Could not get location", details: nil)
            return nil
        }
        
        let locationCoord = LocationCoordinate.make(
            withLatitude: NSNumber(value: coord.coordinate.latitude),
            longitude: NSNumber(value: coord.coordinate.longitude)
        )
        
        return locationCoord
    }
    
}
