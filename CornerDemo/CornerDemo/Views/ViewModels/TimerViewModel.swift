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

enum TickState : Int {
    case didStop  // Timer stopped
    case didStart // Timer started
    case didTick  // Timer ticked
}

protocol TickerDelegate {
    func didUpdate(_ tickState: TickState)
}

class TimerViewModel : ToolbarViewDelegate {
    public fileprivate (set) var subscribers: [TickerDelegate] = []

    var timer = Timer()
    var audioPlayer = AVAudioPlayer()
    let tickSound = NSURL(fileURLWithPath: Bundle.main.path(forResource: "tick", ofType: "wav")!)

    init() {
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
        self.timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.playTickSound), userInfo: nil, repeats: true)
        self.notifySubscribers(tickState: .didStart)
    }

    @objc func playTickSound() {
        self.audioPlayer.play()
        self.notifySubscribers(tickState: .didTick)
    }
}

extension TimerViewModel {
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
extension TimerViewModel {

    func addSubscriber(_ subscriber: TickerDelegate) {
        self.subscribers.append(subscriber)
    }

    func notifySubscribers(tickState: TickState) {
        print ("notifying \(self.subscribers.count) subscribers of state: \(tickState.rawValue)")

        let _ = self.subscribers.map({
            $0.didUpdate(tickState)
        })
    }

    private func removeSubscribers() {
        self.subscribers.removeAll()
    }

}
