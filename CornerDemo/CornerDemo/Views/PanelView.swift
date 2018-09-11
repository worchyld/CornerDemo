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
    let change: Int

    var imgName : String {
        if (change > 0) {
            return Constants.ImageName.arrowUp
        }
        else if (change < 0) {
            return Constants.ImageName.arrowDown
        }
        return Constants.ImageName.arrowUnchanged
    }

    init(title: String, number: Double, unit: UnitSpeed?, change: Int = 0) {
        self.title = title
        self.number = number
        self.unit = unit
        self.change = change
    }
}


class PanelView : UIView {

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblFormattedNumber: UILabel!
    @IBOutlet weak var lblUnit: UILabel!
    @IBOutlet weak var imageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        self.layoutIfNeeded()
    }

    public func setupView(viewModel: PanelViewModel) {
        self.lblTitle.text = viewModel.title

        if let hasUnit = viewModel.unit {
            self.lblUnit.isHidden = false
            self.lblUnit.text = hasUnit.rawValue.uppercased()
        }
        if let hasFormattedNumber = viewModel.formattedNumber {
            self.lblFormattedNumber.isHidden = false
            self.lblFormattedNumber.text = hasFormattedNumber
        }

        self.lblTitle.sizeToFit()
        self.lblFormattedNumber.sizeToFit()
        self.lblUnit.sizeToFit()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        xibSetup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        xibSetup()
    }

    
}
