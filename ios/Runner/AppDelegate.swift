import UIKit
import Flutter
import Firebase
import GoogleMaps
import FirebaseMessaging
import GoogleUtilities
import flutter_background_service_ios // add this

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate , MessagingDelegate{
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
      FirebaseApp.configure()
      SwiftFlutterBackgroundServicePlugin.taskIdentifier = "dev.flutter.background.refresh"

      GeneratedPluginRegistrant.register(with: self)

      Messaging.messaging().delegate = self
            if #available(iOS 10.0, *) {
                UNUserNotificationCenter.current().delegate = self
                let authOptions: UNAuthorizationOptions = [.alert, .badge, .sound]
                UNUserNotificationCenter.current().requestAuthorization(
                        options: authOptions,
                        completionHandler: {_, _ in })
            }
            application.registerForRemoteNotifications()

      GMSServices.provideAPIKey("AIzaSyDoPh2Ui9PyK7m6kAlY32OhCOM_zHz6Lno")
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }

    func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String?) {
        print("fcm token \(fcmToken)")
    }
}
