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

class ToolbarView: UIView, TickerDelegate {
    public fileprivate (set) var subscribers: [ToolbarViewDelegate] = []

    private var fightState : FightState = FightState.rest
    private var timerViewModel: TimerViewModel = TimerViewModel.init()
    private var fightDurationTimer: Timer = Timer()

    @IBOutlet weak var progressView : UIProgressView!
    @IBOutlet weak var playBtn: UIButton!
    @IBOutlet weak var lblDuration: UILabel!
    @IBOutlet weak var lblFightState: UILabel!

    var timeInterval : TimeInterval = TimeInterval.init(Constants.fightTime)

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
        self.fightDurationTimer.invalidate()
    }

    required init?(coder aDecoder: NSCoder) {
        //fatalError("init(coder:) has not been implemented")
        super.init(coder: aDecoder)

        self.addSubscriber(self.timerViewModel)
        self.timerViewModel.addSubscriber(self) // addSubscriber to timerObserver

        self.fightDurationTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.updateProgressView), userInfo: nil, repeats: true)

        xibSetup()
    }

    @objc func updateProgressView() {
        let max: Float = Float(Constants.fightTime) as Float
        self.progressView.progress -= 1.0 / max
        if (self.progressView.progress <= 0) {
            self.fightDurationTimer.invalidate()
        }
        self.lblDuration.text = "\(self.timeInterval)"
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


extension ToolbarView {
    func didUpdate(_ tickState: TickState) {
        print ("TICK STATE DID CHANGE: \(tickState)")

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
        //self.progressView.setProgress(1.0, animated: true)
    }

    func didStop() {
        //self.toggleFightState()
    }

    func didTick() {
        /*
        self.progressView.progress -= (0.1 / Float(Constants.fightTime))
        if (self.progressView.progress <= 0) {
            toggleFightState()
        }*/
    }

}
