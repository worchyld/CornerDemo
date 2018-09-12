//
//  SlideTwo.swift
//  CornerDemo
//
//  Created by Amarjit on 09/09/2018.
//  Copyright © 2018 Amarjit. All rights reserved.
//

import UIKit

class SlideTwoView: UIView {

    lazy var label: UILabel = {
        let xPos = 20
        let yPos = 20
        let width = Int(round(self.frame.width))
        let frame = CGRect(x: xPos, y: yPos, width: width, height: 25)
        let lbl = UILabel(frame: frame)
        lbl.text = NSLocalizedString("Empty slide", comment: "Empty slide")
        lbl.textColor = .white
        lbl.layer.borderWidth = 1
        lbl.layer.borderColor = UIColor.white.cgColor
        lbl.sizeToFit()
        return lbl
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
        self.layoutIfNeeded()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(label)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }




}
