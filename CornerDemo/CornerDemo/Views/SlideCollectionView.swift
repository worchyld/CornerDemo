//
//  SlideCollectionView.swift
//  CornerDemo
//
//  Created by Amarjit on 09/09/2018.
//  Copyright © 2018 Amarjit. All rights reserved.
//

import UIKit

private let reuseIdentifier = "slideCellId"

class SlideCollectionView: UIView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    private lazy var slides: [UIView] = {
        let slideOne : SlideOne = SlideOne()
        let slideTwo : SlideTwo = SlideTwo()
        return [slideOne, slideTwo]
    }()

    private lazy var collectionView: UICollectionView = {
        let cv = UICollectionView(frame: self.frame)
        cv.dataSource = self
        cv.delegate = self
        cv.backgroundColor = .purple
        return cv
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
        layoutIfNeeded()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(collectionView)
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

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)

        // Configure the cell
        cell.backgroundColor = UIColor.red

        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 350, height: 125)
    }
}
