//
//  AppDelegate.swift
//  SmartAppBannerTest
//
//  Created by Ryan DeVore on 5/24/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate
{
    var window: UIWindow? = nil
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool
    {
        let w = UIWindow(frame: UIScreen.main.bounds)
        
        let vc = UITableViewController()
        vc.view = UIView(frame: w.bounds)
        vc.view.backgroundColor = .cyan
        
        w.rootViewController = vc
        w.makeKeyAndVisible()
        
        self.window = w
        
        if let url = launchOptions?[.url]
        {
            NSLog("Launched with URL: \(url)")
        }
        
        if let userActivityType = launchOptions?[.userActivityType]
        {
            NSLog("User Activity Type: \(userActivityType)")
        }
        
        if let userActivityDictionary = launchOptions?[.userActivityDictionary] as? [AnyHashable:Any],
           let userActivity = userActivityDictionary["UIApplicationLaunchOptionsUserActivityKey"] as? NSUserActivity
        {
            NSLog("User Activity URL: \(String(describing: userActivity.webpageURL))")
        }
        
        return true
    }

    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool
    {
        NSLog("url: \(url)")
        return true
    }
    
    
    func application(_ application: UIApplication, continue userActivity: NSUserActivity, restorationHandler: @escaping ([UIUserActivityRestoring]?) -> Void) -> Bool
    {
        NSLog("Continue User Activity URL: \(String(describing: userActivity.webpageURL))")
        
        return false
    }


}
