//
//  Slides.swift
//  CornerDemo
//
//  Created by Amarjit on 08/09/2018.
//  Copyright © 2018 Amarjit. All rights reserved.
//

import Foundation
import UIKit

// Typebreakdown
class SlideTypeBreakdown : UIView {

    lazy var imageView: UIImageView = {
        let iv = UIImageView.init(image: UIImage(named: "typebreakdown"))
        iv.frame = self.bounds
        iv.sizeToFit()
        return iv
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(imageView)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


// Empty slide
class SlideBasic : UIView {
    lazy var label : UILabel = {
        let frame = CGRect(x: 15, y: 15, width: 50, height: 15)
        let lbl = UILabel(frame: frame)
        lbl.sizeToFit()
        return lbl
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = UIColor.blue
        self.addSubview(label)
    }

}

