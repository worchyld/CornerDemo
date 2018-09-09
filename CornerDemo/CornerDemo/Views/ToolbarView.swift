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
    @IBOutlet var labelCollection: [UILabel]!

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

    @IBAction func playBtnDidPress(_ sender: Any) {
        print ("pressed")
        // #TO-DO: notify subscribers
    }
}
