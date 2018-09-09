//
//  SlideCollectionView.swift
//  CornerDemo
//
//  Created by Amarjit on 09/09/2018.
//  Copyright © 2018 Amarjit. All rights reserved.
//

import UIKit

private let reuseIdentifier = "slideCellId"

class SlideCollectionView: UIView, UICollectionViewDelegate,
UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    private lazy var collectionView : UICollectionView = {
        let cv = UICollectionView(frame: self.frame)
        cv.delegate = self
        cv.dataSource = self
        cv.backgroundColor = .purple
        cv.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        return cv
    }()

//    private lazy var pageControl : UIPageControl = {
//        let pc = UIPageControl(frame: frame)
//        pc.currentPage = 1
//        pc.numberOfPages = 2
//        return pc
//    }()

    override func awakeFromNib() {
        super.awakeFromNib()
        layoutIfNeeded()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .blue
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: UICollectionViewDataSource

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }


    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)

        // Configure the cell
        cell.backgroundColor = UIColor.red
        let lbl = UILabel.init(frame: cell.frame)
        lbl.text = "Cell: #\(indexPath.row)"
        cell.addSubview(lbl)

        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.frame.width, height: self.frame.height)
    }
}
