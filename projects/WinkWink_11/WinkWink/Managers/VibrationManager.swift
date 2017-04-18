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
    
    static var isVibrationOn: Bool { return Preferences.shared.isVibrationOn }
    private static let shared = VibrationManager()
    
    static func good() {
        if isVibrationOn {
            AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
        }
    }
    
    static func setVibration(on: Bool) {
        Preferences.shared.isVibrationOn = on
    }

}
