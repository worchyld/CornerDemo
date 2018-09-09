//
//  ViewController.swift
//  CornerDemo
//
//  Created by Amarjit on 06/09/2018.
//  Copyright © 2018 Amarjit. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {

    /*
    lazy var toolbarView : UIView = {

        let height: CGFloat = CGFloat(65.0)
        let posY = (self.view.bounds.maxY - height)
        let width = self.view.bounds.width
        let frame = CGRect(x: 0, y: posY, width: width, height: height)
        let tb = UIView(frame: frame)

//        let tb = Bundle.main.loadNibNamed("ToolbarView", owner: nil, options: nil)?.first as! ToolbarView
        tb.backgroundColor = .red

        return tb
    }()*/

    weak var viewModel: RoundViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }

    private func setupView() {
        self.view.backgroundColor = UIColor( Constants.Colours.bgColor )
        //self.view.addSubview(toolbarView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
