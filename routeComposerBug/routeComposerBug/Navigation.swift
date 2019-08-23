//
//  Router.swift
//  RouteComposerBug
//
//  Created by Artem Tselikov on 2019-08-23.
//  Copyright © 2019 Artem Tselikov. All rights reserved.
//

import Foundation
import RouteComposer
import os.log

struct Navigation {

    static let router: Router = {
        let appRouterLogger: DefaultLogger
        if #available(iOS 10, *) {
            appRouterLogger = DefaultLogger(.verbose, osLog: OSLog(subsystem: Bundle.main.bundleIdentifier!, category: "Router"))
        } else {
            appRouterLogger = DefaultLogger(.verbose)
        }
        var defaultRouter = DefaultRouter(logger: appRouterLogger)
        defaultRouter.add(NavigationDelayingInterceptor(strategy: .wait, logger: appRouterLogger))
        return defaultRouter
    }()

}
