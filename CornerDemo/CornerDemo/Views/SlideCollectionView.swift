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

    var viewModel: MainViewModel!

    private lazy var cellWidth: CGFloat = self.frame.width
    private lazy var cellHeight: CGFloat = 120

    private lazy var flowLayout : UICollectionViewFlowLayout = {
        let f = UICollectionViewFlowLayout()
        f.scrollDirection = .horizontal
        f.itemSize = CGSize(width: cellWidth, height: cellHeight)
        f.minimumInteritemSpacing = CGFloat.greatestFiniteMagnitude
        f.minimumLineSpacing = 5
        return f
    }()

    private lazy var pageControl : UIPageControl = {
        let frame = CGRect(x: self.center.x - 50, y: self.frame.height-15, width: 50, height: 15)
        let pc = UIPageControl(frame: frame)
        pc.currentPage = 1
        pc.numberOfPages = 2
        pc.tintColor = .white
        return pc
    }()

    private lazy var collectionView : UICollectionView = {
        let cv = UICollectionView.init(frame: self.frame, collectionViewLayout: flowLayout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.delegate = self
        cv.dataSource = self
        cv.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        cv.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        cv.isPagingEnabled = true
        return cv
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
        layoutIfNeeded()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(collectionView)
        self.addSubview(pageControl)
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

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)

        // Configure the cell
        configure(cell: cell, indexPath: indexPath)

        return cell
    }

    func configure(cell: UICollectionViewCell, indexPath: IndexPath) {
        let row = indexPath.row

        if (row == 0) {
            let slide : SlideOneView = SlideOneView()
            slide.setViewModel(model: self.viewModel)
            cell.addSubview(slide)
            cell.layoutSubviews()
        } else if (row == 1) {
            let slide : SlideTwoView = SlideTwoView()
            cell.addSubview(slide)
        }

    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.frame.width, height: self.frame.height)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }

    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageIndex = Int(round(self.collectionView.contentOffset.x / self.frame.width)) as Int
        pageControl.currentPage = Int(pageIndex)
    }

}
