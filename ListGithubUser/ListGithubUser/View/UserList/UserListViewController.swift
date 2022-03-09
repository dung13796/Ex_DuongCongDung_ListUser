//
//  UserListViewController.swift
//  ListGithubUser
//
//  Created by Dung Duong C. on 3/9/22.
//

import UIKit

final class UserListViewController: ViewController {

    @IBOutlet private weak var userListTableView: UITableView!

    let refreshControl = UIRefreshControl()
    var viewModel = UserListViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        configTableView()
        getUserList()
    }

    private func configTableView() {
        userListTableView.register(nibWithCellClass: UserListTableViewCell.self)
        userListTableView.dataSource = self
        userListTableView.delegate = self

        configPullToRefresh()
    }

    private func configPullToRefresh() {
        refreshControl.addTarget(self, action: #selector(refresh), for: .valueChanged)
        userListTableView.addSubview(refreshControl)
    }

    private func getUserList() {
        viewModel.getUserList { [weak self] result in
            guard let this = self else { return }
            switch result {
            case .success:
                this.userListTableView.reloadData()
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    this.refreshControl.endRefreshing()
                }
            case .failure(let error):
                this.showAlert(title: "Error", message: error.localizedDescription, buttonTitles: ["OK"])
            }
        }
    }

    @objc private func refresh() {
        getUserList()
    }
}

extension UserListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        navigationController?.pushViewController(viewModel.didSelectRow(at: indexPath), animated: true)
    }
}

extension UserListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfItems()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withClass: UserListTableViewCell.self)
        cell.viewModel = viewModel.viewModelForCell(at: indexPath)
        return cell
    }
}
