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

    static var isSoundEffectOn = true
    static var isMusicOn = true
    private static let sharedInstance = SoundManager()
    private var musicPlayer: AVAudioPlayer?
    
    private init() {
        self.musicPlayer = SoundManager.audioPlayer(filename: Sound.Filename.defaultLavelBackground)!
    }

    static func backgroundMusicPlay() {
        SoundManager.sharedInstance.musicPlayer?.play()
    }
    
    static func backgroundMusicStop() {
        SoundManager.sharedInstance.musicPlayer?.stop()
    }
    
    static func backgroundMusicSetVolume(level: Float) {
        SoundManager.sharedInstance.musicPlayer?.volume = level
    }
    
    static func getSoundNode(filename: Sound.Filename) -> SKAudioNode? {
        guard
            bundleContainsFile(withName: filename.rawValue),
            SoundManager.isSoundEffectOn else { return nil }
        let node = SKAudioNode(fileNamed: filename.rawValue)
        node.autoplayLooped = false
        node.isPositional = false
        return node
    }
    
    private static func audioPlayer(filename: Sound.Filename) -> AVAudioPlayer? {
        guard
            bundleContainsFile(withName: filename.rawValue),
            SoundManager.isMusicOn else { return nil }
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
    
}
