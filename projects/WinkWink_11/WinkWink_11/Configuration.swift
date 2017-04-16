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
    static let font = Font()
    static let layout = Layout()
    static let sound = Sound()
    static let time = TimePalette()
    static let transition = Transition()

}

class ColorPalette {
    let backgroundPrimary = UIColor(r: 250, g: 252, b: 245, a: 255)
    let backgroundSecondary = UIColor(r: 220, g: 150, b: 145, a: 255)
    let backgroundDisabled = UIColor(r: 255, g: 255, b: 255, a: 100)
    let textPrimary = UIColor.black
}

class Font {
    class Size {
        let big: CGFloat = 72
        let medium: CGFloat = 44
        let regular: CGFloat = 30
        let small: CGFloat = 24
    }
    let size = Size()
}

class Sound {
    let defaultSound = SKAction.playSoundFileNamed(Filename.beep.rawValue, waitForCompletion: false)
    enum Filename: String {
        case beep = "beep.wav"
    }
}

class TimePalette {
    let defaultDuration: TimeInterval = 0.5
}

class Transition {
    let defaultTransition = SKTransition.fade(with: Configuration.color.backgroundPrimary, duration: Configuration.time.defaultDuration)
}

class Layout {
    let paddingDefault: CGFloat = 8
    let navigationHeight: CGFloat = 64
}


