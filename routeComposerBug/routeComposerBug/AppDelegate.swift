//
//  AppDelegate.swift
//  RouteComposerBug
//
//  Created by Artem Tselikov on 2019-08-23.
//  Copyright © 2019 Artem Tselikov. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var vc: UIViewController?
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        window = UIWindow(frame: UIScreen.main.bounds)

        vc = UIViewController()
        vc?.view.backgroundColor = .orange

        window?.rootViewController = vc
        window?.makeKeyAndVisible()

        try? Navigation.router.navigate(to: Path.accountSelector, with: nil, animated: true, completion: nil)
        return true
    }

    // modal presentation bug
    // xcrun simctl openurl booted rcbug://overlay?account=Account2

    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {

        guard let urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false),
            let queryItems = urlComponents.queryItems
            else {
                return false
            }


        guard let account = queryItems.first(where : {$0.name == "account"})?.value else {
            return false
        }

        switch urlComponents.host {
        case "green":

           try? Navigation.router.navigate(to: Path.green, with: NavigationContext(account: account), animated: true, completion: nil)

            return true
        case "red":

               try? Navigation.router.navigate(to: Path.red, with: NavigationContext(account: account), animated: true, completion: nil)

            return true

        case "modal":
            try? Navigation.router.navigate(to: Path.modal, with: NavigationContext(account: account), animated: true, completion: nil)
            return true

        case "overlay":
            try? Navigation.router.navigate(to: Path.overlay, with: NavigationContext(account: account), animated: true, completion: nil)
                       return true
        default:
            return false
        }
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

