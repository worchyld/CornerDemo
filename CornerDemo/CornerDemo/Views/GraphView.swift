//
//  GraphView.swift
//  CornerDemo
//
//  Created by Amarjit on 09/09/2018.
//  Copyright © 2018 Amarjit. All rights reserved.
//

import UIKit

class GraphView: UIView {

    private lazy var placeholderImgView : UIImageView = {
        let iv = UIImageView(image: UIImage(named: "graph-placeholder"))
        iv.frame = self.bounds
        iv.contentMode = .scaleAspectFill
        return iv
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
        self.layoutIfNeeded()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(placeholderImgView)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


}
