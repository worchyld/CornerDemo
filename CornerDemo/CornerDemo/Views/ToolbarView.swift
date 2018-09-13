//
//  ToolbarView.swift
//  CornerDemo
//
//  Created by Amarjit on 08/09/2018.
//  Copyright © 2018 Amarjit. All rights reserved.
//

import UIKit

class ToolbarView: UIView, TickerDelegate {
    public fileprivate (set) var subscribers: [ToolbarViewDelegate] = []

    private var fightState : FightState = FightState.rest
    private var timerModel: TimerModel = TimerModel(with: Constants.fightTime)

    @IBOutlet weak var progressView : UIProgressView!
    @IBOutlet weak var playBtn: UIButton!
    @IBOutlet weak var lblDuration: UILabel!
    @IBOutlet weak var lblFightState: UILabel!

    var timeInterval : TimeInterval = TimeInterval.init(Constants.fightTime)

    override func awakeFromNib() {
        super.awakeFromNib()
        self.layoutIfNeeded()
        self.progressView.progress = 1
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        xibSetup()
    }

    deinit {
        self.removeSubscribers()
        self.timerModel.stopTimer()
    }

    required init?(coder aDecoder: NSCoder) {
        //fatalError("init(coder:) has not been implemented")
        super.init(coder: aDecoder)

        self.addSubscriber(self.timerModel)
        self.timerModel.addSubscriber(self) // addSubscriber to timerObserver

        xibSetup()
    }

    @objc func updateDurationText(time: TimeInterval) {
        self.lblDuration.text = ObjectCache.stopWatchFormatter.string(from: time)
        self.lblDuration.sizeToFit()
    }


    @IBAction func playBtnDidPress(_ sender: Any) {
        toggleFightState()
    }

    private func toggleFightState() {
        handleToggle()
        self.notifySubscribers()
    }

    private func handleToggle() {
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
        let _ = self.subscribers.map({
            print ("Notified")
            $0.didPressButton(state: self.fightState)
        })
    }

    private func removeSubscribers() {
        self.subscribers.removeAll()
    }
}


extension ToolbarView {
    func didUpdate(_ tickState: TickState) {
        switch tickState {
        case .didStart:
            didStart()
            break

        case .didTick:
            didTick()
            break

        case .didStop:
            didStop()
            break
        }
    }

    func didStart() {
        let time = self.timerModel.elaspedTime
        self.updateDurationText(time: time)
        self.progressView.progress = 1.0
    }

    func didStop() {
    }

    func didTick() {
        let time = self.timerModel.elaspedTime
        self.updateDurationText(time: time)

        if (time > 0) {
            let interval = Float(0.01)
            self.progressView.progress -= interval
        }
    }

}
