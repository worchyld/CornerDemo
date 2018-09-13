//
//  TimerModel.swift
//  CornerDemo
//
//  Created by Amarjit on 12/09/2018.
//  Copyright © 2018 Amarjit. All rights reserved.
//

import Foundation
import AVFoundation
import AudioToolbox

protocol ToolbarViewDelegate {
    func didPressButton(state: FightState)
}

enum TickState : Int {
    case didStop  // Timer stopped
    case didStart // Timer started
    case didTick  // Timer ticked
}

protocol TickerDelegate {
    func didUpdate(_ tickState: TickState)
    func didStop()
    func didStart()
    func didTick()
}

class TimerModel : ToolbarViewDelegate {
    public fileprivate (set) var subscribers: [TickerDelegate] = []

    public private(set) var _initTime: TimeInterval
    var elaspedTime: TimeInterval
    var timer = Timer()
    var audioPlayer = AVAudioPlayer()
    let tickSound = NSURL(fileURLWithPath: Bundle.main.path(forResource: "tick", ofType: "wav")!)

    init(with time: TimeInterval) {
        self._initTime = time
        self.elaspedTime = time
        loadSounds()        
    }

    deinit {
        self.stopTimer()
        self.removeSubscribers()
    }

    private func loadSounds() {
        do {
            audioPlayer = try AVAudioPlayer.init(contentsOf: self.tickSound as URL)
            audioPlayer.prepareToPlay()
        } catch {
            print("Error getting the audio file")
        }
    }

    func stopTimer() {
        self.timer.invalidate()
        self.audioPlayer.stop()
        self.notifySubscribers(tickState: .didStop)
    }

    func startTimer() {
        self.resetElaspedTime()
        self.timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.updateTimer), userInfo: nil, repeats: true)
        self.notifySubscribers(tickState: .didStart)
    }

    @objc func updateTimer() {
        if (self.elaspedTime > TimeInterval.init(0)) {
            self.elaspedTime -= TimeInterval.init(1)
            playSound()
            self.notifySubscribers(tickState: .didTick)
        }
        else {
            stopTimer()
        }
    }

    private func playSound() {
        self.audioPlayer.play()
    }

    private func resetElaspedTime() {
        if (self._initTime > Double(0)) {
            self.elaspedTime = self._initTime
        } else {
            self.elaspedTime = Constants.fightTime
        }
    }
}

extension TimerModel {
    func didPressButton(state: FightState) {
        print ("Did press state: \(state)")
        // start/pause timer
        switch state {
        case .rest:
            self.stopTimer()
            self.notifySubscribers(tickState: .didStop)
            break
        case .fight:
            self.startTimer()
            self.notifySubscribers(tickState: .didStart)
            break
        }
    }
}


// Ticker subscirption
extension TimerModel {

    func addSubscriber(_ subscriber: TickerDelegate) {
        self.subscribers.append(subscriber)
    }

    func notifySubscribers(tickState: TickState) {
        let _ = self.subscribers.map({
            $0.didUpdate(tickState)
        })
    }

    private func removeSubscribers() {
        self.subscribers.removeAll()
    }

}
