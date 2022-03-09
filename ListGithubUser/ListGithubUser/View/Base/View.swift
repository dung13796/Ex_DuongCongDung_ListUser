//
//  View.swift
//  ListGithubUser
//
//  Created by Dung Duong C. on 3/9/22.
//

import Foundation
import UIKit

class View: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        loadNib()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        loadNib()
    }

    private func loadNib() {
        let bundle = Bundle.main
        var xib: String?
        let name = String(describing: type(of: self))

        if let _ = bundle.path(forResource: name, ofType: "nib") {
            xib = name
        }

        if let xib = xib, let view = bundle.loadNibNamed(xib, owner: self)?.first as? UIView {
            addSubview(view)
            view.fillToSuperview()
        }
    }
}
