//
//  Path.swift
//  RouteComposerBug
//
//  Created by Artem Tselikov on 2019-08-23.
//  Copyright © 2019 Artem Tselikov. All rights reserved.
//

import Foundation
import RouteComposer

struct Path {

    static var accountSelector: DestinationStep<AccountSelectorViewController, NavigationContext?> {
        return StepAssembly(
            finder: ClassFinder<AccountSelectorViewController, NavigationContext?>(),
            factory: ClassFactory<AccountSelectorViewController, NavigationContext?>())
            .using(CATransaction.wrap(UINavigationController.push()))
            .from(NavigationControllerStep())
            .using(CATransaction.wrap(GeneralAction.replaceRoot()))
            .from(GeneralStep.current())
            .assemble()
    }

    static var accountHome: DestinationStep <TabbarViewController, NavigationContext?> {
        return StepAssembly(
            finder: ClassWithContextFinder<TabbarViewController, NavigationContext?>(),
            factory: TabBarFactory())
            .adding(ContextSettingTask())
            .using(CATransaction.wrap(UINavigationController.push()))
            .from(accountSelector.expectingContainer())
            .assemble()
    }

    static var green: DestinationStep <GreenViewController, NavigationContext?> {
        return StepAssembly(
            finder: ClassWithContextFinder<GreenViewController, NavigationContext?>(),
            factory: NilFactory())
            .from(Path.accountHome)
            .assemble()
    }


    static var red: DestinationStep <RedViewController, NavigationContext?> {
        return StepAssembly(
            finder: ClassWithContextFinder<RedViewController, NavigationContext?>(),
            factory: NilFactory())
            .from(Path.accountHome)
            .assemble()
    }

    static var modal: DestinationStep <ModalVCViewController, NavigationContext?> {
        return StepAssembly(
            finder: ClassWithContextFinder<ModalVCViewController, NavigationContext?>(),
            factory:  ClassFactory<ModalVCViewController, NavigationContext?>())
            .adding(ContextSettingTask())
            .using(CATransaction.wrap(GeneralAction.presentModally()))
            .from(Path.red)
            .assemble()
    }
}
