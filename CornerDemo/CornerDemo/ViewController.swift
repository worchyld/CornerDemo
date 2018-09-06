//
//  ViewController.swift
//  CornerDemo
//
//  Created by Amarjit on 06/09/2018.
//  Copyright © 2018 Amarjit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    weak var viewModel: RoundViewModel?


    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    private func setup() {
        self.view.backgroundColor = UIColor( Constants.Colours.bgColor )
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

