//
//  ViewController.swift
//  CornerDemo
//
//  Created by Amarjit on 06/09/2018.
//  Copyright © 2018 Amarjit. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {

    weak var viewModel: RoundViewModel?

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
    }

    private func setup() {
        self.scrollView.delegate = self
        self.view.backgroundColor = UIColor( Constants.Colours.bgColor )

        let slides = setupSlides()
        setupSlideView(slides: slides )
        self.pageControl.numberOfPages = slides.count
        self.pageControl.currentPage = 0
        view.bringSubview(toFront: self.pageControl)

        updateViewConstraints()
    }

    private func setupSlides() -> [Slide] {
        let slide1:Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
        let slide2:Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide

        slide1.lblSlideTitle.text = "Slide 1"
        slide2.lblSlideTitle.text = "Slide 2"

        return [slide1, slide2]
    }

    private func setupSlideView(slides: [Slide]) {
        let width = view.frame.width

        self.scrollView.isPagingEnabled = true
        self.scrollView.showsVerticalScrollIndicator = false
        self.scrollView.alwaysBounceHorizontal = false

        self.scrollView.frame = CGRect(x: 0, y: 325, width: width, height: 125)
        self.scrollView.contentSize = CGSize(width: width * CGFloat(slides.count), height: 125)

        let _ = slides.enumerated().map { (offset, element) in
            element.frame = CGRect(x: width * CGFloat(offset), y: 0, width: width, height: 125)
            scrollView.addSubview(element)
        }

        scrollView.updateConstraintsIfNeeded()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageIndex = round(scrollView.contentOffset.x / scrollView.frame.width)
        pageControl.currentPage = Int(pageIndex)
    }
}

