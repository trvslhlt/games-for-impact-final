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

}

class ColorPalette {
    
    let backgroundPrimary = UIColor(colorLiteralRed: 80 / 255.0, green: 120 / 255.0, blue: 120 / 255.0, alpha: 1)
    let textPrimary = UIColor.white
    
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


