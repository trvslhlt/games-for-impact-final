//
//  Configuration.swift
//  WinkWink_11
//
//  Created by trvslhlt on 4/8/17.
//  Copyright © 2017 travis holt. All rights reserved.
//

import UIKit
import SpriteKit

class Configuration: NSObject {
    
    static let color = ColorPalette()
    static let time = TimePalette()
    static let transition = Transition()
    static let sound = Sound()
    static let layout = Layout()

}

class ColorPalette {
    
    let backgroundPrimary = UIColor(r: 250, g: 252, b: 245, a: 255)
    let backgroundSecondary = UIColor(r: 220, g: 150, b: 145, a: 255)
    let textPrimary = UIColor.black
    
}

class TimePalette {
    
    let defaultDuration: TimeInterval = 0.5
    
}

class Transition {
    
    let defaultTransition = SKTransition.fade(with: Configuration.color.backgroundPrimary, duration: Configuration.time.defaultDuration)
    
}

class Sound {
    
    let defaultSound = SKAction.playSoundFileNamed(Filenames.beep.rawValue, waitForCompletion: false)
    
    enum Filenames: String {
        case beep = "beep.wav"
    }
    
}

class Layout {

    let paddingDefault: CGFloat = 8
    let navigationHeight: CGFloat = 64

}


