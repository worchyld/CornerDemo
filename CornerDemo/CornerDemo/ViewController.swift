//
//  ViewController.swift
//  CornerDemo
//
//  Created by Amarjit on 06/09/2018.
//  Copyright © 2018 Amarjit. All rights reserved.
//

import UIKit
import SideMenu


private let reuseIdentifier = "CellId"

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate  {

    private lazy var graphView: GraphView = {
        return GraphView.init(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width, height: 150))
    }()
    private lazy var panelCollectionView: PanelCollectionView = {
        let view = PanelCollectionView.init(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width, height:155))
        return view
    }()

    private lazy var slideCollectionView: SlideCollectionView = {
        let view = SlideCollectionView.init(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width, height:150))
        return view
    }()

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
        self.collectionView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)

        // Define the menus
         let menuLeftNavigationController = storyboard!.instantiateViewController(withIdentifier: "LeftMenuNavigationController") as! UISideMenuNavigationController
        SideMenuManager.default.menuLeftNavigationController = menuLeftNavigationController
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
            cell.addSubview(panelCollectionView)
            break

        case 2:
            cell.addSubview(slideCollectionView)
            break

        default:
            break
        }

        return cell
    }
}



