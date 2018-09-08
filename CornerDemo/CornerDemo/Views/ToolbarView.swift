//
//  ToolbarView.swift
//  CornerDemo
//
//  Created by Amarjit on 08/09/2018.
//  Copyright © 2018 Amarjit. All rights reserved.
//

import UIKit

class ToolbarView: UIView {

    @IBOutlet weak var progressView : UIProgressView!
    @IBOutlet weak var playBtn: UIButton!
    @IBOutlet weak var lblDuration: UILabel!
    @IBOutlet weak var lblRest: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        self.layoutIfNeeded()
    }
}
