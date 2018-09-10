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

    private lazy var cellWidth: CGFloat = self.frame.width
    private lazy var cellHeight: CGFloat = self.frame.height

    private lazy var flowLayout : UICollectionViewFlowLayout = {
        let f = UICollectionViewFlowLayout()
        f.scrollDirection = .horizontal
        f.itemSize = CGSize(width: cellWidth, height: cellHeight)
        f.minimumInteritemSpacing = CGFloat.greatestFiniteMagnitude
        f.minimumLineSpacing = 5
        return f
    }()


    private lazy var collectionView : UICollectionView = {
        let cv = UICollectionView.init(frame: self.frame, collectionViewLayout: flowLayout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.delegate = self
        cv.dataSource = self
        cv.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        cv.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        return cv
    }()

    private lazy var pageControl : UIPageControl = {
        let xPos: Int = Int(round(frame.height - 36)) as Int
        let yPos: Int = Int(round(self.frame.width/2)) as Int
        let pcFrame = CGRect(x: xPos, y: yPos, width: 100, height: 36)
        let pc = UIPageControl(frame: frame)
        pc.currentPage = 1
        pc.numberOfPages = 2
        pc.tintColor = .blue
        return pc
    }()

    private lazy var slides:[UIView] = {
        let frame = CGRect(x: 0, y: 0, width: cellWidth, height: cellHeight)
        let slideOne : UIView = SlideOneView(frame: frame)
        let slideTwo : UIView = SlideTwoView(frame: frame)

        let slides = [slideOne, slideTwo]
        return slides
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
        layoutIfNeeded()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .blue
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
        return slides.count
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)

        // Configure the cell
        let row = indexPath.row
        let slideView: UIView = slides[row] as UIView
        cell.addSubview(slideView)

        return cell
    }

}
