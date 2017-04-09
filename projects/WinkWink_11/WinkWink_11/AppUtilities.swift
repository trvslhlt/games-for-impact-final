//
//  AppUtilities.swift
//  WinkWink_11
//
//  Created by trvslhlt on 4/9/17.
//  Copyright © 2017 travis holt. All rights reserved.
//

import Foundation

func delay(duration: TimeInterval, instructions: @escaping () -> ()) {
    let when = DispatchTime.now() + duration
    DispatchQueue.main.asyncAfter(deadline: when) {
        instructions()
    }
}
