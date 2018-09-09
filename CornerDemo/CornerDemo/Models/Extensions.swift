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


protocol Identifiable {
    static var identifier: String { get }
}
extension Identifiable {
    static var identifier: String {
        return String(describing: self)
    }
}
protocol NibLoadable: Identifiable {
    static var nibName: String { get }
}
extension NibLoadable {
    @nonobjc static var nibName: String {
        return String(describing: self)
    }
}
extension UIView {
    static func loadFromNib<T: NibLoadable>(ofType _: T.Type) -> T {
        guard let nibViews = Bundle.main.loadNibNamed(T.nibName, owner: nil, options: nil) else {
            fatalError("Could not instantiate view from nib file.")
        }

        for view in nibViews {
            if let typedView = view as? T {
                return typedView
            }
        }
        fatalError("Could not instantiate view from nib file.")
    }
}

extension UIView {

    /// Helper method to init and setup the view from the Nib.
    func xibSetup() {
        let view = loadFromNib()
        addSubview(view)
        stretch(view: view)
    }


    /// Method to init the view from a Nib.
    ///
    /// - Returns: Optional UIView initialized from the Nib of the same class name.
    func loadFromNib<T: UIView>() -> T {
        let selfType = type(of: self)
        let bundle = Bundle(for: selfType)
        let nibName = String(describing: selfType)
        let nib = UINib(nibName: nibName, bundle: bundle)

        guard let view = nib.instantiate(withOwner: self, options: nil).first as? T else {
            fatalError("Error loading nib with name \(nibName)")
        }

        return view
    }


    /// Stretches the input view to the UIView frame using Auto-layout
    ///
    /// - Parameter view: The view to stretch.
    func stretch(view: UIView) {
        view.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: topAnchor),
            view.leftAnchor.constraint(equalTo: leftAnchor),
            view.rightAnchor.constraint(equalTo: rightAnchor),
            view.bottomAnchor.constraint(equalTo: bottomAnchor)
            ])

    }
}
