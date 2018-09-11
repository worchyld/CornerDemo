//
//  PanelCollectionView.swift
//  CornerDemo
//
//  Created by Amarjit on 10/09/2018.
//  Copyright © 2018 Amarjit. All rights reserved.
//

import UIKit

private let reuseIdentifier = "panelCellId"

// contains 3 panels, punches, speed and power

class PanelCollectionView: UIView, UICollectionViewDelegate,
    UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    var viewModel: RoundViewModel!

    private lazy var flowLayout : UICollectionViewFlowLayout = {
        let f = UICollectionViewFlowLayout()
        f.scrollDirection = .horizontal
        f.itemSize = CGSize(width: 130, height: 125)
        f.minimumInteritemSpacing = 15
        return f
    }()

    private lazy var collectionView : UICollectionView = {
        let cv = UICollectionView(frame: self.frame, collectionViewLayout: flowLayout)
        cv.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        cv.delegate = self
        cv.dataSource = self
        return cv
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
        layoutIfNeeded()
    }


    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(collectionView)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: UICollectionViewDataSource

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)

        configure(cell: cell, atIndexPath: indexPath)

        return cell
    }

    func configure(cell:UICollectionViewCell, atIndexPath: IndexPath) {

        let view = PanelView()

        switch atIndexPath.row {
        case 0:
            break
        case 1:
            break

        case 2:
            break

        default:
            break
        }

        cell.addSubview(view)
        cell.backgroundColor = UIColor( Constants.Colours.panelBGColor )
    }


    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 130, height: 125)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }

}
