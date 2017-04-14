//
//  AppView.swift
//  WinkWink_11
//
//  Created by trvslhlt on 4/14/17.
//  Copyright © 2017 travis holt. All rights reserved.
//

import UIKit

class AppView: UIView {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func commonInit() {
        self.backgroundColor = Configuration.color.backgroundPrimary
    }

}
