//
//  Preferences.swift
//  WinkWink
//
//  Created by trvslhlt on 4/18/17.
//  Copyright © 2017 travis holt. All rights reserved.
//

import Foundation

class Preferences: NSObject, NSCoding {

    var isSoundOn: Bool {
        didSet {
            save()
        }
    }
    var isMusicOn: Bool {
        didSet {
            save()
        }
    }
    var isVibrationOn: Bool {
        didSet {
            save()
        }
    }
    static let shared = Preferences.get()
    private static let preferencesKey = "preferences"
    private static let isSoundOnKey = "isSoundOn"
    private static let isMusicOnKey = "isMusicOn"
    private static let isVibrationOnKey = "isVibrationOn"
    
    init(
        isSoundOn: Bool,
        isMusicOn: Bool,
        isVibrationOn: Bool) {
        self.isSoundOn = isSoundOn
        self.isMusicOn = isMusicOn
        self.isVibrationOn = isVibrationOn
    }
    
    required convenience init(coder aDecoder: NSCoder) {
        let isSoundOn = aDecoder.decodeBool(forKey: Preferences.isSoundOnKey)
        let isMusicOn = aDecoder.decodeBool(forKey: Preferences.isMusicOnKey)
        let isVibrationOn = aDecoder.decodeBool(forKey: Preferences.isVibrationOnKey)
        self.init(isSoundOn: isSoundOn,
                  isMusicOn: isMusicOn,
                  isVibrationOn: isVibrationOn)
    }
    
    private static func get() -> Preferences {
        if let existingPreferencesData = UserDefaults.standard.value(forKey: preferencesKey) as? Data {
            let a = NSKeyedUnarchiver.unarchiveObject(with: existingPreferencesData) as! Preferences
            return a
        } else {
            return Preferences.defaultPreferences()
        }
    }
    
    private static func defaultPreferences() -> Preferences {
        return Preferences(isSoundOn: true, isMusicOn: true, isVibrationOn: true)
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(isSoundOn, forKey: Preferences.isSoundOnKey)
        aCoder.encode(isMusicOn, forKey: Preferences.isMusicOnKey)
        aCoder.encode(isVibrationOn, forKey: Preferences.isVibrationOnKey)
    }
    
    func save() {
        let encodedData: Data = NSKeyedArchiver.archivedData(withRootObject: self)
        UserDefaults.standard.set(encodedData, forKey: Preferences.preferencesKey)
        UserDefaults.standard.synchronize()
    }

}
