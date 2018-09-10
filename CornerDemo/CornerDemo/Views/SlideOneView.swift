//
//  SlideOne.swift
//  CornerDemo
//
//  Created by Amarjit on 09/09/2018.
//  Copyright © 2018 Amarjit. All rights reserved.
//

import UIKit

class SlideOneView: UIView {

    override func awakeFromNib() {
        super.awakeFromNib()
        self.layoutIfNeeded()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        xibSetup()
    }

    required init?(coder aDecoder: NSCoder) {
        //fatalError("init(coder:) has not been implemented")
        super.init(coder: aDecoder)
        xibSetup()
    }


}
