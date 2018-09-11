//
//  SlideOne.swift
//  CornerDemo
//
//  Created by Amarjit on 09/09/2018.
//  Copyright © 2018 Amarjit. All rights reserved.
//

import UIKit

struct SlideOneViewModel {
    var field: String = "123"

    struct Left {
        var jab: Int = 0
        var hook: Int = 0
        var uppercut: Int = 0
    }
    struct Right {
        var cross: Int = 0
        var hook: Int = 0
        var uppercut: Int = 0
    }

    let left: Left
    let right: Right

    init(left: Left, right: Right) {
        self.left = left
        self.right = right
    }

}

class SlideOneView: UIView {

    @IBOutlet weak var leftJabValue: UILabel! {
        didSet {
            leftJabValue.sizeToFit()
        }
    }
    @IBOutlet weak var leftHookValue: UILabel! {
        didSet {
            leftHookValue.sizeToFit()
        }
    }
    @IBOutlet weak var leftUppercutValue: UILabel! {
        didSet {
            leftUppercutValue.sizeToFit()
        }
    }

    @IBOutlet weak var rightCrossValue: UILabel! {
        didSet {
            rightCrossValue.sizeToFit()
        }
    }
    @IBOutlet weak var rightHookValue: UILabel! {
        didSet {
            rightHookValue.sizeToFit()
        }
    }
    @IBOutlet weak var rightUppercutValue: UILabel! {
        didSet {
            rightUppercutValue.sizeToFit()
        }
    }

    @IBOutlet weak var panelTitleLabel: UILabel! {
        didSet {
            panelTitleLabel.sizeToFit()
        }
    }
    @IBOutlet var panelLabelCollection: [UILabel]!
    @IBOutlet var progressViewCollection: [UIProgressView]!

    public private(set) var viewModel: SlideOneViewModel?

    override init(frame: CGRect) {
        super.init(frame: frame)
        xibSetup()
        setupView()
    }

    required init?(coder aDecoder: NSCoder) {
        //fatalError("init(coder:) has not been implemented")
        super.init(coder: aDecoder)
    }

    public func setViewModel(viewModel: SlideOneViewModel) {
        self.viewModel = viewModel
    }

    private func setupView() {
        let _ = progressViewCollection.enumerated().map {
            ( _, element:UIProgressView) in
            element.trackTintColor = UIColor(Constants.Colours.bgColor)
            if (element.tag < 3) {
                element.progressTintColor = UIColor(Constants.Colours.green)
            }
            else {
                print ("transform")
                element.progressTintColor = UIColor(Constants.Colours.blue)
                //element.transform = CGAffineTransform(rotationAngle: CGFloat(-M_PI));
                let rotate = -(Double.pi)
                element.transform = CGAffineTransform(rotationAngle: CGFloat(rotate))
            }
        }

        self.panelTitleLabel.text = "Type breakdown"

        self.leftJabValue.text = "6"
        self.leftHookValue.text = "5"
        self.leftUppercutValue.text = "2"

        self.rightCrossValue.text = "4"
        self.rightHookValue.text = "2"
        self.rightUppercutValue.text = "3"

    }

}
