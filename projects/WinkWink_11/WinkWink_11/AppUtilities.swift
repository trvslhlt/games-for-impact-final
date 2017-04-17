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

func bundleContainsFile(withName filename: String) -> Bool {
    return Bundle.main.path(forResource: filename, ofType: nil) != nil
}

//class Weak<T: AnyObject> {
//    weak var value: T?
//    init(value: T) {
//        self.value = value
//    }
//}

//extension Array where Element: Weak<AnyObject> {
//
//    mutating func reap() {
//        self = self.filter { nil != $0.value }
//    }
//
//}
