//
//  SoundManager.swift
//  WinkWink_11
//
//  Created by trvslhlt on 4/15/17.
//  Copyright © 2017 travis holt. All rights reserved.
//

import SpriteKit
import AVFoundation

class SoundManager {

    static var isSoundOn: Bool { return shared.isSoundOn }
    static var isMusicOn: Bool { return shared.isMusicOn }
    private static let shared = SoundManager()
    private var isMusicOn = true
    private var isSoundOn = true
    private var musicPlayer: AVAudioPlayer?
    
    private init() {
        self.musicPlayer = SoundManager.audioPlayer(filename: Sound.Filename.defaultLavelBackground)!
    }

    static func backgroundMusicPlay() {
        shared.musicPlayer?.play()
    }
    
    static func backgroundMusicStop() {
        shared.musicPlayer?.stop()
    }
    
    static func backgroundMusicSetVolume(level: Float) {
        shared.musicPlayer?.volume = level
    }
    
    static func getSoundNode(filename: Sound.Filename) -> AppAudioNode? {
        guard
            bundleContainsFile(withName: filename.rawValue) else { return nil }
        let node = AppAudioNode(fileNamed: filename.rawValue)
        node.autoplayLooped = false
        node.isPositional = false
        return node
    }
    
    private static func audioPlayer(filename: Sound.Filename) -> AVAudioPlayer? {
        guard
            bundleContainsFile(withName: filename.rawValue) else { return nil }
        let path = Bundle.main.path(forResource: filename.rawValue, ofType: nil)
        let url = URL.init(fileURLWithPath: path!)
        
        do {
            let audioPlayer = try AVAudioPlayer(contentsOf: url)
            let audioSession = AVAudioSession.sharedInstance()
            try audioSession.setCategory(AVAudioSessionCategoryPlayback)
            try audioSession.setActive(true)
            audioPlayer.numberOfLoops = -1
            audioPlayer.volume = 0.2
            return audioPlayer
        } catch {
            return nil
        }
    }
    
    static func setSound(on: Bool) {
        shared.isSoundOn = on
    }
    
    static func setMusic(on: Bool) {
        if on {
            shared.musicPlayer?.play()
        } else {
            shared.musicPlayer?.pause()
        }
    }
    
}
