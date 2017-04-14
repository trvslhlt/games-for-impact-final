//
//  AppDelegate.swift
//  WinkWink_11
//
//  Created by trvslhlt on 4/7/17.
//  Copyright © 2017 travis holt. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var timer: LevelTimer?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        timer = LevelTimer()
        timer?.start()
        timer?.didUpdateElapsedTime = { elapsed in
            print(elapsed)
            if elapsed > 10 {
                print("done")
                self.timer?.pause()
            }
        }
        
        return true
    }

}

