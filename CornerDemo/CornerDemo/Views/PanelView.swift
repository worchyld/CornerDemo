//
//  PanelView.swift
//  CornerDemo
//
//  Created by Amarjit on 06/09/2018.
//  Copyright © 2018 Amarjit. All rights reserved.
//

import Foundation
import UIKit

struct PanelViewModel {
    let title: String
    private let number: Double
    public var formattedNumber: String? {
        return "99.9"
    }
    let unit: UnitSpeed?

    let showUnit: Bool
    let showImageView: Bool
    let change: Int

    init(title: String, number: Double, unit: UnitSpeed?) {
        self.title = title
        self.number = number
        self.unit = unit

        if let _ = self.unit {
            showUnit = true
        }
        else {
            showUnit = false
        }
        self.showImageView = true
        self.change = 0
    }
}

class PanelView : UIView {

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblFormattedNumber: UILabel!
    @IBOutlet weak var lblUnit: UILabel!
    @IBOutlet weak var imageView: UIImageView!

    @IBOutlet var lblCollection: [UILabel]!

    override func awakeFromNib() {
        super.awakeFromNib()
        self.layoutIfNeeded()
    }

    public func setupView(viewModel: PanelViewModel) {
        
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
