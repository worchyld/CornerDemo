//
//  ViewController.swift
//  CornerDemo
//
//  Created by Amarjit on 06/09/2018.
//  Copyright © 2018 Amarjit. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {

    weak var viewModel: RoundViewModel?

    let mainPanelView: MainPanelView = {
        return MainPanelView()
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
    }

    private func setup() {
        //self.view.backgroundColor = UIColor( Constants.Colours.bgColor )
        view.addSubview(mainPanelView)
        view.addConstraintsWithFormat(format: "H:|[v0]|", views: mainPanelView)
        view.addConstraintsWithFormat(format: "V:|[v0(150)]", views: mainPanelView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
