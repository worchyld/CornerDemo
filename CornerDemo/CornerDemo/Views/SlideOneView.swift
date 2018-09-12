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

    @IBOutlet weak var leftJabProgressView: UIProgressView!
    @IBOutlet weak var leftHookProgressView: UIProgressView!
    @IBOutlet weak var leftUppercutProgressView: UIProgressView!
    @IBOutlet weak var rightCrossProgressView: UIProgressView!
    @IBOutlet weak var rightHookProgressView: UIProgressView!
    @IBOutlet weak var rightUppercutProgressView: UIProgressView!
    

    var viewModel: MainViewModel?

    override func awakeFromNib() {
        super.awakeFromNib()
        self.layoutIfNeeded()
    }


    override init(frame: CGRect) {
        super.init(frame: frame)
        xibSetup()
        setupView()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    func setViewModel(model: MainViewModel) {
         self.viewModel = model

        guard let hasViewModel = self.viewModel else {
            return
        }
        let maxProgressValue = hasViewModel.maxProgress

        self.leftJabProgressView.progress = (Float(hasViewModel.punch.left.jab) / maxProgressValue)
        self.leftHookProgressView.progress = (Float(hasViewModel.punch.left.hook) / maxProgressValue)
        self.leftUppercutProgressView.progress = (Float(hasViewModel.punch.left.hook) / maxProgressValue)
        self.rightCrossProgressView.progress = (Float(hasViewModel.punch.left.hook) / maxProgressValue)


        self.leftJabValue.text = String(hasViewModel.punch.left.jab)
        self.leftHookValue.text = String(hasViewModel.punch.left.hook)
        self.leftUppercutValue.text = String(hasViewModel.punch.left.uppercut)

        self.rightCrossValue.text = String(hasViewModel.punch.right.cross)
        self.rightHookValue.text = String(hasViewModel.punch.right.hook)
        self.rightUppercutValue.text = String(hasViewModel.punch.right.uppercut)

        self.layoutSubviews()
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

    override func layoutSubviews() {
        super.layoutSubviews()

        let _ = self.panelLabelCollection.map { (lbl: UILabel) -> Void in
            lbl.sizeToFit()
        }

        self.animateAllProgressViews()
    }

    private func animateAllProgressViews() {
        // UIView appear
        waitFor(duration: 0.25) { (completed: Bool) in
            if (completed) {

                UIView.animate(withDuration: 1.25, animations: { () -> Void in
                    print ("animating")

                    let _ = self.progressViewCollection.map({ (v: UIProgressView) -> Void in
                        print ("v: \(v.tag) \(v.progress)")

                        // NOTE: The v.progress doesn't seem to work when setting progress
                        v.setProgress(1, animated: true)

                    })
                })
            }
        }
    }

}
