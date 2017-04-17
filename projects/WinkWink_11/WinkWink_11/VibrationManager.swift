//
//  VibrationManager.swift
//  WinkWink_11
//
//  Created by trvslhlt on 4/17/17.
//  Copyright © 2017 travis holt. All rights reserved.
//

import UIKit
import AudioToolbox

class VibrationManager {
    
    private static let shared = VibrationManager()
    private var isVibrationOn = true
    
    static func good() {
        if shared.isVibrationOn {
            AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
        }
    }
    
    static func setVibration(on: Bool) {
        shared.isVibrationOn = on
    }

}
