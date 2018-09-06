//
//  PanelView.swift
//  CornerDemo
//
//  Created by Amarjit on 06/09/2018.
//  Copyright © 2018 Amarjit. All rights reserved.
//

import Foundation
import UIKit

class PanelView : UIView {

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblData: UILabel!
    @IBOutlet weak var lblUnit: UILabel!
    @IBOutlet weak var imageView: UIImageView!

    @IBOutlet var lblCollection: [UILabel]!

    
    override func awakeFromNib() {
        self.layoutIfNeeded()
        setup()
    }

    private func setup() {
    }


    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    /*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func draw(_ rect: CGRect) {
     // Drawing code
     }
     */

}
