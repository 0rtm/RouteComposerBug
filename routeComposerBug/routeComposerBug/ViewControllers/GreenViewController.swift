//
//  GreenViewController.swift
//  RouteComposerBug
//
//  Created by Artem Tselikov on 2019-08-23.
//  Copyright © 2019 Artem Tselikov. All rights reserved.
//

import UIKit
import RouteComposer

class GreenViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!

    var context: NavigationContext?

    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = context?.account

        let backButton = UIBarButtonItem(title: "Back", style: .done, target: self, action: #selector(goBack))
        navigationItem.leftBarButtonItem = backButton
    }

    @objc func goBack() {
        try? Navigation.router.navigate(to: Path.accountSelector, with: context, animated: true, completion: nil)
    }

}

extension GreenViewController: ContextChecking {

    typealias Context = NavigationContext?

    func isTarget(for context: NavigationContext?) -> Bool {
        return self.context == context
    }

}
