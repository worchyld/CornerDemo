//
//  Extensions.swift
//  CornerDemo
//
//  Created by Amarjit on 08/09/2018.
//  Copyright © 2018 Amarjit. All rights reserved.
//

import Foundation
import UIKit

extension UIView {

    func addConstraintsWithFormat(format: String, views: UIView...) {

        var viewsDict = [String: UIView]()

        for (index, view) in views.enumerated() {

            view.translatesAutoresizingMaskIntoConstraints = false
            viewsDict["v\(index)"] = view
        }

        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutFormatOptions(), metrics: nil, views: viewsDict))
    }

    func addConstraintsFillEntireView(view: UIView) {
        addConstraintsWithFormat(format: "H:|[v0]|", views: view)
        addConstraintsWithFormat(format: "V:|[v0]|", views: view)
    }
}
