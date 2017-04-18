//
//  SettingsViewController.swift
//  WinkWink_11
//
//  Created by trvslhlt on 4/17/17.
//  Copyright © 2017 travis holt. All rights reserved.
//

import UIKit

class SettingsViewController: AppViewController {
    
    @IBOutlet weak var soundSwitch: UISwitch!
    @IBOutlet weak var musicSwitch: UISwitch!
    @IBOutlet weak var vibrationSwitch: UISwitch!

    override func viewDidLoad() {
        super.viewDidLoad()
        soundSwitch.isOn = SoundManager.isSoundOn
        musicSwitch.isOn = SoundManager.isMusicOn
        vibrationSwitch.isOn = VibrationManager.isVibrationOn
    }
    
    @IBAction func cancelTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func soundSettingChanged(_ sender: UISwitch) {
        SoundManager.setSound(on: sender.isOn)
    }
    
    @IBAction func musicSettingChanged(_ sender: UISwitch) {
        SoundManager.setMusic(on: sender.isOn)
    }
    
    @IBAction func vibrationSettingChanged(_ sender: UISwitch) {
        VibrationManager.setVibration(on: sender.isOn)
    }

}
