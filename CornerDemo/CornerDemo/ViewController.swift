//
//  ViewController.swift
//  CornerDemo
//
//  Created by Amarjit on 06/09/2018.
//  Copyright © 2018 Amarjit. All rights reserved.
//

import UIKit

private let reuseIdentifier = "CellId"

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate  {

    lazy var graphView: GraphView = {
        return GraphView.init(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width, height: 150))
    }()
//    lazy var slideCollectionView: SlideCollectionView = {
//        return SlideCollectionView.init(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width, height: 125))
//    }()

    var viewModel: RoundViewModel!
    @IBOutlet weak var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = RoundViewModel(withRound: 1)
        setupView()
    }

    private func setupView() {
        self.title = self.viewModel.pageTitle
        self.view.backgroundColor = UIColor( Constants.Colours.bgColor )
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
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
        switch indexPath.row {
        case 0:
            cell.addSubview(graphView)
            break

        case 1:
            break

        case 2:
            //cell.addSubview(slideCollectionView)
            break

        default:
            break
        }

        return cell
    }
}
