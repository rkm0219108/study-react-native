//
//  AppDelegate.swift
//  StudyReactNative
//
//  Created by Ri Kenmi on 2020/11/28.
//

import UIKit

#if FB_SONARKIT_ENABLED
func initializeFlipper(application: UIApplication) {
  let client = FlipperClient.shared()
  let layoutDescriptorMapper = SKDescriptorMapper()
  client?.add(FlipperKitLayoutPlugin(rootNode: application, with: layoutDescriptorMapper))
  client?.add(FKUserDefaultsPlugin(suiteName: nil))
  client?.add(FlipperKitReactPlugin())
  client?.add(FlipperKitNetworkPlugin(networkAdapter: SKIOSNetworkAdapter()))
  client?.start()
}
#endif

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, RCTBridgeDelegate {

  var window: UIWindow?

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    #if FB_SONARKIT_ENABLED
    initializeFlipper(application: application)
    #endif

    guard let bridge = RCTBridge(delegate: self, launchOptions: launchOptions) else { return false }
    let rootView = RCTRootView(bridge: bridge, moduleName: "StudyReactNative", initialProperties: nil)
    rootView.backgroundColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1)

    window = UIWindow(frame: UIScreen.main.bounds)
    let rootViewController = UIViewController()
    rootViewController.view = rootView
    window?.rootViewController = rootViewController
    window?.makeKeyAndVisible()
    return true
  }

  func sourceURL(for bridge: RCTBridge!) -> URL! {
    #if DEBUG
    return RCTBundleURLProvider.sharedSettings()?.jsBundleURL(forBundleRoot: "index", fallbackResource: nil)
    #else
    return Bundle.main.url(forResource: "main", withExtension: "jsbundle")
    #endif
  }
}
