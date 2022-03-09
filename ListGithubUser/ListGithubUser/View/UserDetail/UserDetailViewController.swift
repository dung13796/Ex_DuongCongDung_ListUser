//
//  UserDetailViewController.swift
//  ListGithubUser
//
//  Created by Dung Duong C. on 3/9/22.
//

import UIKit

class UserDetailViewController: ViewController {

    
    @IBOutlet weak var userAvatarImageView: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var bioLabel: UILabel!
    @IBOutlet weak var publicRepoView: StatsView!
    @IBOutlet weak var followerView: StatsView!
    @IBOutlet weak var followingView: StatsView!
    
    var viewModel = UserDetailViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
        getUserDetail()
    }

    private func configStatsView() {
        guard let url = URL(string: viewModel.userInformation?.avatar ?? "") else { return }
        userAvatarImageView.load(url: url)
        usernameLabel.text = viewModel.userDetail.username
        locationLabel.text = viewModel.userDetail.location
        bioLabel.text = viewModel.userDetail.bio
        publicRepoView.viewModel = viewModel.viewModelForPublicRepoView()
        followerView.viewModel = viewModel.viewModelForFollowerView()
        followingView.viewModel = viewModel.viewModelForFollowingView()
    }

    private func configUI() {
        userAvatarImageView.setCircularImageView()
    }

    private func getUserDetail() {
        viewModel.getUserDetail { [weak self] result in
            guard let this = self else { return }
            switch result {
            case .success:
                this.configStatsView()
            case .failure(let error):
                this.showAlert(title: "Error", message: error.localizedDescription, buttonTitles: ["OK"])
            }
        }
    }
}
