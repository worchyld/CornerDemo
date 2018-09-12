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

class TimerViewModel : ToolbarViewDelegate {
    var timer = Timer()
    var audioPlayer = AVAudioPlayer()
    let tickSound = NSURL(fileURLWithPath: Bundle.main.path(forResource: "tick", ofType: "wav")!)

    init() {
        loadSounds()
    }

    deinit {
        self.stopTimer()
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
    }

    func startTimer() {
        self.timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.playTickSound), userInfo: nil, repeats: true)
    }

    @objc func playTickSound() {
        self.audioPlayer.play()
    }
}

extension TimerViewModel {
    func didPressButton(state: FightState) {
        print ("Did press state: \(state)")
        // start/pause timer
        switch state {
        case .rest:
            self.stopTimer()
            break
        case .fight:
            self.startTimer()
            break
        }
    }
}
