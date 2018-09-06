//
//  Slide.swift
//  CornerDemo
//
//  Created by Amarjit on 06/09/2018.
//  Copyright © 2018 Amarjit. All rights reserved.
//

import UIKit

class Slide: UIView {

    @IBOutlet weak var lblSlideTitle: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        self.layoutIfNeeded()
    }

}
