//
//  ModalVCViewController.swift
//  RouteComposerBug
//
//  Created by Artem Tselikov on 2019-08-26.
//  Copyright © 2019 Artem Tselikov. All rights reserved.
//

import UIKit
import RouteComposer

class ModalVCViewController: UIViewController {

    @IBOutlet weak var label: UILabel!

    var context: NavigationContext?

    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = context?.account
        // Do any additional setup after loading the view.
    }

    @IBAction func close(_ sender: Any) {
        try? Navigation.router.navigate(to: Path.accountHome, with: context, animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension ModalVCViewController: ContextChecking {

    func isTarget(for context: NavigationContext?) -> Bool {
        return self.context == context
    }

    typealias Context = NavigationContext?
}

extension ModalVCViewController: ContextAccepting {

    func setup(with context: NavigationContext?) throws {
        self.context = context
    }

}
