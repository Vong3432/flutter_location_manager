//
//  LocationManager.swift
//  Runner
//
//  Created by Vong Nyuksoon on 16/06/2022.
//

import Foundation
import CoreLocation

///https://infinum.com/handbook/flutter/basics/platform-specific-code
class LocationManager: NSObject, CLLocationManagerDelegate, ObservableObject {
    private var locationManager: CLLocationManager
    
    @Published private(set) var lastLocation: CLLocation?
    private(set) var heading: CLHeading?
    private(set) var authorizationStatus: CLAuthorizationStatus = .notDetermined
    
    override init() {
        locationManager = CLLocationManager()
        locationManager.requestAlwaysAuthorization()
        
        super.init()
        
        getAuthorizationStatus()
        
        locationManager.delegate = self
        locationManager.startUpdatingLocation()
        locationManager.allowsBackgroundLocationUpdates = true
        locationManager.pausesLocationUpdatesAutomatically = false
        locationManager.desiredAccuracy = kCLLocationAccuracyBest

    }
    
    private func getAuthorizationStatus() {
        if #available(iOS 14.0, *) {
            self.authorizationStatus = locationManager.authorizationStatus
        } else {
            // Fallback on earlier versions
            switch CLLocationManager.authorizationStatus() {
            case .notDetermined:
                //Ask for permission
                self.authorizationStatus = CLAuthorizationStatus.notDetermined
                break
            case .restricted:
                // user retricted to use location service.(Ex: parental control)
                self.authorizationStatus = CLAuthorizationStatus.restricted
                break
            case .denied:
                //user denied location service
                self.authorizationStatus = CLAuthorizationStatus.denied
                break
            case .authorizedAlways:
                //always allow
                self.authorizationStatus = CLAuthorizationStatus.authorizedAlways
                break
            case .authorizedWhenInUse:
                // when in use
                self.authorizationStatus = CLAuthorizationStatus.authorizedWhenInUse
                break
            @unknown default:
                break
            }
        }
    }
    
    func headingAvailable() -> Bool {
        return CLLocationManager.headingAvailable()
    }
    
    func requestPermission() {
        locationManager.startUpdatingLocation()
        locationManager.requestAlwaysAuthorization()
    }
    
    func changeAccuracy(to accuracy: CLLocationAccuracy) {
        locationManager.desiredAccuracy = accuracy
    }
    
    func getCurrentLocation() {
        changeAccuracy(to: kCLLocationAccuracyNearestTenMeters)
        locationManager.requestLocation()
    }
    
    func startUpdatingHeading() {
        locationManager.startUpdatingHeading()
    }
    
    func stopUpdatingHeading() {
        locationManager.stopUpdatingHeading()
    }
    
    func startUpdating() {
        locationManager.startUpdatingLocation()
    }
    
    func stopUpdating() {
        lastLocation = nil
        locationManager.stopUpdatingLocation()
    }
    
    // delegates
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        getAuthorizationStatus()
        print("Change auth")
        if authorizationStatus != .authorizedWhenInUse || authorizationStatus != .authorizedAlways {
            lastLocation = nil
            stopUpdating()
        }
    }
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print("Change location")
        guard let location = locations.first else { return }
        lastLocation = location
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateHeading newHeading: CLHeading) {
        heading = newHeading
    }
}
