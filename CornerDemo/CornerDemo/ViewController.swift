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
        let view = GraphView.init(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width, height: 150))
        return view
    }()
    private lazy var panelCollectionView: PanelCollectionView = {
        let view = PanelCollectionView.init(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width, height:150))
        view.viewModel = self.viewModel
        return view
    }()

    private lazy var slideCollectionView: SlideCollectionView = {
        let view = SlideCollectionView.init(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width, height:150))
        view.viewModel = self.viewModel
        return view
    }()

    var viewModel: RoundViewModel!
    @IBOutlet weak var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()

        DispatchQueue.global(qos:.userInteractive).async {
            self.viewModel = RoundViewModel()

            DispatchQueue.main.async {
                self.setupView()
                self.collectionView.reloadData()
            }
        }
    }

    private func setupView() {
        let top = self.navigationController?.navigationBar.frame.height ?? 44
        self.title = self.viewModel.pageTitle
        self.view.backgroundColor = UIColor( Constants.Colours.bgColor )
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        self.collectionView.contentInset = UIEdgeInsets(top: top, left: 0, bottom: 0, right: 0)

        let flow = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        flow.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0)
        let itemSpacing: CGFloat = 25
        let itemsInOneLine: CGFloat = 1
        let width = UIScreen.main.bounds.size.width - itemSpacing * CGFloat(itemsInOneLine - 1)
        flow.itemSize = CGSize(width: floor(width/itemsInOneLine), height: 150)
        flow.minimumInteritemSpacing = 25
        flow.minimumLineSpacing = 25

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



