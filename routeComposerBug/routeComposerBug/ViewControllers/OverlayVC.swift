//
//  OverlayVC.swift
//  routeComposerBug
//
//  Created by Artem Tselikov on 2020-01-27.
//  Copyright © 2020 Artem Tselikov. All rights reserved.
//

import Foundation
import UIKit
import RouteComposer

class OverlayVC: UIViewController {

    var context: NavigationContext?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white.withAlphaComponent(0.4)

        let button = UIButton(frame: CGRect(x: 100, y: 100, width: 100, height: 50))
        button.backgroundColor = .green
        button.setTitle("Navigate", for: .normal)
        button.addTarget(self, action: #selector(button1Action), for: .touchUpInside)

        self.view.addSubview(button)

        let button2 = UIButton(frame: CGRect(x: 200, y: 100, width: 100, height: 50))
        button2.backgroundColor = .orange
        button2.setTitle("Dismiss", for: .normal)
        button2.addTarget(self, action: #selector(button2Action), for: .touchUpInside)

        self.view.addSubview(button)
        self.view.addSubview(button2)
    }

    @objc
    func button1Action() {
        try? Navigation.router.navigate(to: Path.green, with: context, animated: true, completion: nil)
    }

    @objc
    func button2Action() {
        dismiss(animated: true, completion: nil)
    }

}

extension OverlayVC: ContextChecking {

    typealias Context = NavigationContext?

    func isTarget(for context: NavigationContext?) -> Bool {
        return self.context == context
    }

}

extension OverlayVC: ContextAccepting {

    func setup(with context: NavigationContext?) throws {
        self.context = context
    }

}
