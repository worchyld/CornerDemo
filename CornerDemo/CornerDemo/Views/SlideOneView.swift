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

    var viewModel: SlideOneViewModel?

    override init(frame: CGRect) {
        super.init(frame: frame)
        xibSetup()
        //setup()
    }

    required init?(coder aDecoder: NSCoder) {
        //fatalError("init(coder:) has not been implemented")
        super.init(coder: aDecoder)
        xibSetup()
    }

    public func setup(viewModel: SlideOneViewModel) {
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
