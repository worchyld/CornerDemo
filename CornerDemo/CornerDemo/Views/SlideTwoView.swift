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
        let frame = CGRect(x: 20, y: 20, width: 55, height: 20)
        let lbl = UILabel(frame: frame)
        lbl.text = NSLocalizedString("Empty slide", comment: "Empty slide")
        lbl.textColor = .white
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
