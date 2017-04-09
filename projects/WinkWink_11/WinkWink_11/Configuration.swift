//
//  Configuration.swift
//  WinkWink_11
//
//  Created by trvslhlt on 4/8/17.
//  Copyright © 2017 travis holt. All rights reserved.
//

import UIKit

class Configuration: NSObject {
    
    static let color = ColorPalette()
    static let time = TimePalette()

}

class ColorPalette {
    
    let backgroundPrimary = UIColor(colorLiteralRed: 180 / 255.0, green: 220 / 255.0, blue: 220 / 255.0, alpha: 1)
    
}

class TimePalette {
    
    let defaultDuration: TimeInterval = 0.5
    
}


