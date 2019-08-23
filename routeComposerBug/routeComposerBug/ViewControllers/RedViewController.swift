//
//  RedViewController.swift
//  RouteComposerBug
//
//  Created by Artem Tselikov on 2019-08-23.
//  Copyright © 2019 Artem Tselikov. All rights reserved.
//

import UIKit
import RouteComposer

class RedViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    var context: NavigationContext?

    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = context?.account
    }
}


extension RedViewController: ContextChecking {

    typealias Context = NavigationContext?

    func isTarget(for context: NavigationContext?) -> Bool {
        return self.context == context
    }

}
