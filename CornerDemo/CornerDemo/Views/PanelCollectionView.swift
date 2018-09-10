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


    private lazy var flowLayout : UICollectionViewFlowLayout = {
        let f = UICollectionViewFlowLayout()
        f.scrollDirection = .horizontal
        f.itemSize = CGSize(width: 165, height: 155)
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
        cv.isPagingEnabled = false
        cv.isScrollEnabled = false
        return cv
    }()

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

        // Configure the cell
        cell.backgroundColor = .red

        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.frame.width, height: self.frame.height)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
}
