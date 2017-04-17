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

    private static var isSoundEffectOn = true
    private static var isMusicOn = true
    private static let shared = SoundManager()
    private var musicPlayer: AVAudioPlayer?
    private var soundNodes = [Weak<AppAudioNode>]()
    
    private init() {
        self.musicPlayer = SoundManager.audioPlayer(filename: Sound.Filename.defaultLavelBackground)!
    }

    static func backgroundMusicPlay() {
        SoundManager.shared.musicPlayer?.play()
    }
    
    static func backgroundMusicStop() {
        SoundManager.shared.musicPlayer?.stop()
    }
    
    static func backgroundMusicSetVolume(level: Float) {
        SoundManager.shared.musicPlayer?.volume = level
    }
    
    static func getSoundNode(filename: Sound.Filename) -> AppAudioNode? {
        guard
            bundleContainsFile(withName: filename.rawValue),
            SoundManager.isSoundEffectOn else { return nil }
        let node = AppAudioNode(fileNamed: filename.rawValue)
        node.autoplayLooped = false
        node.isPositional = false
        SoundManager.shared.soundNodes.append(Weak(value: node))
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
    
    static func setSound(on: Bool) {
        isSoundEffectOn = on
        let action = isSoundEffectOn ? SKAction.play() : SKAction.pause()
        for weakNode in shared.soundNodes {
            if let node = weakNode.value {
                node.run(action)
            }
        }
    }
    
    static func setMusic(on: Bool) {
        if on {
            shared.musicPlayer?.play()
        } else {
            shared.musicPlayer?.pause()
        }
        
    }
    
}

class AppAudioNode: SKAudioNode {}

class Weak<T: AnyObject> {
    weak var value: T?
    init(value: T) {
        self.value = value
    }
}

//extension Array where Element: Weak<AnyObject> {
//    
//    mutating func reap() {
//        self = self.filter { nil != $0.value }
//    }
//    
//}
