//
//  TabBarFactory.swift
//  RouteComposerBug
//
//  Created by Artem Tselikov on 2019-08-23.
//  Copyright © 2019 Artem Tselikov. All rights reserved.
//

import UIKit
import RouteComposer

struct TabBarFactory: Factory {

    typealias ViewController = TabbarViewController

    typealias Context = NavigationContext?

    func build(with context: NavigationContext?) throws -> TabbarViewController {

        let vc = TabbarViewController()

        let greenVC = GreenViewController(nibName: "GreenViewController", bundle: nil)
        greenVC.context = context
        greenVC.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 0)


        let redVC = RedViewController(nibName: "RedViewController", bundle: nil)
        redVC.context = context
        redVC.tabBarItem = UITabBarItem(tabBarSystemItem: .history, tag: 1)

        var navvedVcs = [UIViewController]()

        for vc in [greenVC, redVC] {
            let nav = UINavigationController(rootViewController: vc)
            navvedVcs.append(nav)
        }

        vc.viewControllers = navvedVcs

        return vc
    }


}
