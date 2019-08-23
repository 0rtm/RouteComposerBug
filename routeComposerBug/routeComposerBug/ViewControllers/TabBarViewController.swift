//
//  TabBarViewController.swift
//  RouteComposerBug
//
//  Created by Artem Tselikov on 2019-08-23.
//  Copyright © 2019 Artem Tselikov. All rights reserved.
//

import UIKit
import RouteComposer

class TabbarViewController: UITabBarController {


    var context: NavigationContext?


}


extension TabbarViewController: ContextChecking {

    typealias Context = NavigationContext?

    func isTarget(for context: NavigationContext?) -> Bool {
        return self.context == context
    }
}
