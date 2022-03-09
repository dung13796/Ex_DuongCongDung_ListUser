//
//  UserListTableViewCell.swift
//  ListGithubUser
//
//  Created by Dung Duong C. on 3/9/22.
//

import UIKit

class UserListTableViewCell: UITableViewCell {

    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var urlLabel: UILabel!
    @IBOutlet private weak var userAvatarImageView: UIImageView!

    var viewModel: UserListCellViewModel? {
        didSet {
            updateView()
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        configUI()
    }

    private func updateView() {
        guard let viewModel = viewModel else { return }
        guard let url = URL(string: viewModel.userInformation.avatar ?? "") else { return }
        userAvatarImageView.load(url: url)
        nameLabel.text = viewModel.userInformation.name
        urlLabel.text = viewModel.userInformation.url
    }

    private func configUI() {
        userAvatarImageView.setCircularImageView()
    }
}
