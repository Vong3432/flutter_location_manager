import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
    
    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
        let locationManagerChannel = FlutterMethodChannel(name: "com.vong.dev/location_manager",
                                                  binaryMessenger: controller.binaryMessenger)
        let api = LocationAPIClass(methodChannel: locationManagerChannel)
        LocationAPISetup(controller.binaryMessenger, api)
        
//        locationManagerChannel.setMethodCallHandler({
//            [weak self] (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
//            // This method is invoked on the UI thread.
//            // Handle location manager status.
//            guard call.method == "getLocationManagerStatus" else {
//                result(FlutterMethodNotImplemented)
//                return
//            }
//        })
        
        GeneratedPluginRegistrant.register(with: self)
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
}
