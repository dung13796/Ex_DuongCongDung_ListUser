//
//  StatsView.swift
//  ListGithubUser
//
//  Created by Dung Duong C. on 3/9/22.
//

import Foundation
import UIKit

class StatsView: View {

    @IBOutlet private weak var numberLabel: UILabel!
    @IBOutlet private weak var titleLabel: UILabel!

    var viewModel: StatsViewModel? {
        didSet {
            updateUI()
        }
    }

    private func updateUI() {
        guard let viewModel = viewModel else { return }
        numberLabel.text = String(describing: viewModel.number)
        titleLabel.text = viewModel.title
    }
}
