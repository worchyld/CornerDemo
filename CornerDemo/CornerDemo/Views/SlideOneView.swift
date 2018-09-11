//
//  SlideOne.swift
//  CornerDemo
//
//  Created by Amarjit on 09/09/2018.
//  Copyright © 2018 Amarjit. All rights reserved.
//

import UIKit

class SlideOneView: UIView {

    @IBOutlet weak var leftJabValue: UILabel!
    @IBOutlet weak var leftHookValue: UILabel!
    @IBOutlet weak var leftUppercutValue: UILabel!

    @IBOutlet weak var rightCrossValue: UILabel!
    @IBOutlet weak var rightHookValue: UILabel!
    @IBOutlet weak var rightUppercutValue: UILabel!

    @IBOutlet weak var panelTitleLabel: UILabel!

    @IBOutlet var panelLabelCollection: [UILabel]!
    
    @IBOutlet var progressViewCollection: [UIProgressView]!


    override init(frame: CGRect) {
        super.init(frame: frame)
        xibSetup()
        setup()
    }

    required init?(coder aDecoder: NSCoder) {
        //fatalError("init(coder:) has not been implemented")
        super.init(coder: aDecoder)
        xibSetup()
    }

    func setup() {
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
    }

}
