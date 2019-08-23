//
//  AccountSelectorViewController.swift
//
//
//  Created by Artem Tselikov on 2019-07-31.
//  Copyright © 2019 Artem Tselikov. All rights reserved.
//

import UIKit
import RouteComposer


class AccountSelectorViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    private let accounts: [String] = ["Account1", "Account2"]

    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "Accounts", style: .plain, target: nil, action: nil)
        title = "Account Selector"
    }

    private func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "aCell")
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: false)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }

}

extension AccountSelectorViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return accounts.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "aCell")!
        cell.textLabel?.text = accounts[indexPath.row]
        return cell
    }

}

extension AccountSelectorViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let account = accounts[indexPath.row]

        try? Navigation.router.navigate(to: Path.accountHome, with: NavigationContext(account: account),  animated: true, completion: nil)
    }

}
