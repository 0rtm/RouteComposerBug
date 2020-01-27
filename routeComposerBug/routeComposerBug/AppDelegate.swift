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
        case "overlay2":
            try? Navigation.router.navigate(to: Path.overlay2, with: NavigationContext(account: account), animated: true, completion: nil)
            return true
        default:
            return false
        }
    }
}

