//
//  ToolbarView.swift
//  CornerDemo
//
//  Created by Amarjit on 08/09/2018.
//  Copyright © 2018 Amarjit. All rights reserved.
//

import UIKit

protocol ToolbarViewDelegate {
    func didPressButton(state: FightState)
}


class ToolbarView: UIView {
    public fileprivate (set) var subscribers: [ToolbarViewDelegate] = []

    private var fightState : FightState = FightState.rest
    private var timerViewModel: TimerViewModel = TimerViewModel.init()

    @IBOutlet weak var progressView : UIProgressView!
    @IBOutlet weak var playBtn: UIButton!
    @IBOutlet weak var lblDuration: UILabel!
    @IBOutlet weak var lblFightState: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        self.layoutIfNeeded()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        xibSetup()
    }

    deinit {
        self.removeSubscribers()
        self.timerViewModel.stopTimer()
    }

    required init?(coder aDecoder: NSCoder) {
        //fatalError("init(coder:) has not been implemented")
        super.init(coder: aDecoder)

        self.addSubscriber(self.timerViewModel)

        xibSetup()
    }

    @IBAction func playBtnDidPress(_ sender: Any) {
        self.toggleFightState()
        self.notifySubscribers()
    }

    private func toggleFightState() {
        self.playBtn.isSelected = !self.playBtn.isSelected
        if (self.fightState == .fight) {
            self.fightState = .rest
        }
        else {
            self.fightState = .fight
        }
        self.lblFightState.text = self.fightState.rawValue.capitalizingFirstLetter()
        self.lblFightState.sizeToFit()
    }

}

extension ToolbarView {
    
    func addSubscriber(_ subscriber: ToolbarViewDelegate) {
        self.subscribers.append(subscriber)
    }

    func notifySubscribers() {
        print ("notifying \(self.subscribers.count) subscribers")
        let _ = self.subscribers.map({
            print ("Notified")
            $0.didPressButton(state: self.fightState)
        })
    }

    private func removeSubscribers() {
        self.subscribers.removeAll()
    }

}

