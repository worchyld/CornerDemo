//
//  MainPanelView.swift
//  CornerDemo
//
//  Created by Amarjit on 08/09/2018.
//  Copyright © 2018 Amarjit. All rights reserved.
//

import UIKit

// The view that holds the panels
private let reuseIdentifier = "cellId"

class MainPanelView: UIView, UICollectionViewDataSource, UICollectionViewDelegate {

    lazy var cv : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: self.frame, collectionViewLayout: layout)
        cv.delegate = self
        cv.dataSource = self
        cv.backgroundColor = .red
        return cv
    }()


    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(cv)
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: UICollectionViewDataSource

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 3
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)

        // Configure the cell
        cell.backgroundColor = .yellow

        return cell
    }


}
