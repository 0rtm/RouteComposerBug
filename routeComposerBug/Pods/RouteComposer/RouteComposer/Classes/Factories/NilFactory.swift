//
//  NilFactory.swift
//  RouteComposer
//
//  Created by Eugene Kazaev on 08/02/2018.
//

import Foundation
import UIKit

/// The dummy struct used to represent the `Factory` that does not build anything.
/// Its only purpose is to provide the type safety checks for the `StepAssembly`.
///
/// For example, the `UIViewController` of the step was already loaded and integrated into a stack by a
/// storyboard in a previous step.
public struct NilFactory<VC: UIViewController, C>: Factory, NilEntity {

    // MARK: Associated types

    public typealias ViewController = VC

    public typealias Context = C

    // MARK: Methods

    /// Constructor
    public init() {
    }

    public func prepare(with context: C) throws {
        throw RoutingError.compositionFailed(.init("This factory can not build any UIViewController."))
    }

    public func build(with context: C) throws -> VC {
        throw RoutingError.compositionFailed(.init("This factory can not build any UIViewController."))
    }

}
