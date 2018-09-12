//
//  SlideOne.swift
//  CornerDemo
//
//  Created by Amarjit on 09/09/2018.
//  Copyright © 2018 Amarjit. All rights reserved.
//

import UIKit

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

    var viewModel: RoundViewModel?

    override func awakeFromNib() {
        super.awakeFromNib()
        self.layoutIfNeeded()
        /*
        UIView.animate(withDuration: 1.0, animations: { () -> Void in

        })*/
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        xibSetup()
        setupView()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    func setViewModel(model: RoundViewModel) {
         self.viewModel = model

        guard let hasViewModel = self.viewModel else {
            return
        }

        let _ = progressViewCollection.map {
            $0.setProgress(1, animated: true)
            $0.progress = 0.0
        }

        self.leftJabValue.text = String(hasViewModel.punch.left.jab)
        self.leftHookValue.text = String(hasViewModel.punch.left.hook)
        self.leftUppercutValue.text = String(hasViewModel.punch.left.uppercut)

        self.rightCrossValue.text = String(hasViewModel.punch.right.cross)
        self.rightHookValue.text = String(hasViewModel.punch.right.hook)
        self.rightUppercutValue.text = String(hasViewModel.punch.right.uppercut)
    }

    private func setupView() {
        let _ = progressViewCollection.enumerated().map {
            ( _, element:UIProgressView) in
            element.trackTintColor = UIColor(Constants.Colours.bgColor)
            if (element.tag < 3) {
                element.progressTintColor = UIColor(Constants.Colours.green)
            }
            else {
                element.progressTintColor = UIColor(Constants.Colours.blue)
                let rotationAngle = -(Double.pi)
                element.transform = CGAffineTransform(rotationAngle: CGFloat(rotationAngle))
            }
        }

        self.panelTitleLabel.text = NSLocalizedString("Type breakdown", comment: "Slide title")
    }

}
