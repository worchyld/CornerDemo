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

    lazy var graphView: GraphView = {
        return GraphView.init(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width, height: 150))
    }()
    lazy var slideCollectionView: SlideCollectionView = {
        return SlideCollectionView.init(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width, height: 135))
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

extension ViewController: UISideMenuNavigationControllerDelegate {

    func sideMenuWillAppear(menu: UISideMenuNavigationController, animated: Bool) {
        print("SideMenu Appearing! (animated: \(animated))")
    }

    func sideMenuDidAppear(menu: UISideMenuNavigationController, animated: Bool) {
        print("SideMenu Appeared! (animated: \(animated))")
    }

    func sideMenuWillDisappear(menu: UISideMenuNavigationController, animated: Bool) {
        print("SideMenu Disappearing! (animated: \(animated))")
    }

    func sideMenuDidDisappear(menu: UISideMenuNavigationController, animated: Bool) {
        print("SideMenu Disappeared! (animated: \(animated))")
    }

}

