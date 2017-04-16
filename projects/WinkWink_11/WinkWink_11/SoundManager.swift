//
//  SoundManager.swift
//  WinkWink_11
//
//  Created by trvslhlt on 4/15/17.
//  Copyright © 2017 travis holt. All rights reserved.
//

import SpriteKit

class SoundManager {

    static var isSoundOn = true
    static var isMusicOn = true
    
    static func getSoundNode(filename: Sound.Filename) -> SKAudioNode? {
        guard
            Bundle.main.path(forResource: filename.rawValue, ofType: nil) != nil,
            SoundManager.isMusicOn else { return nil }
        let node = SKAudioNode(fileNamed: filename.rawValue)
        node.autoplayLooped = false
        node.isPositional = false
        return node
    }
    
}
