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
    let backgroundPrimary = UIColor(r: 239, g: 218, b: 114, a: 255)
    let backgroundDisabled = UIColor(r: 255, g: 255, b: 255, a: 100)
    let backgroundDark = UIColor.black
    let textPrimary = UIColor.white
    let selected = UIColor(r: 255, g: 255, b: 255, a: 100)
    let complete = UIColor.white
    let incomplete = UIColor.black
}

class Font {
    class Size {
        let big: CGFloat = 80
        let medium: CGFloat = 44
        let regular: CGFloat = 30
        let small: CGFloat = 22
    }
    class Name {
        let main = "AvenirNext-Bold"
    }
    let size = Size()
    let name = Name()
}

class Sound {
    let defaultSound = SKAction.playSoundFileNamed(Filename.beep.rawValue, waitForCompletion: false)
    enum Filename: String {
        case beep = "beep.wav"
        case defaultLavelBackground = "background_music.mp3"
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


