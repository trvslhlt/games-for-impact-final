//
//  AppLabel.swift
//  WinkWink
//
//  Created by trvslhlt on 4/23/17.
//  Copyright © 2017 travis holt. All rights reserved.
//

import UIKit

class AppLabel: UILabel {

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func commonInit() {
        font = UIFont(name: Configuration.font.name.main, size: Configuration.font.size.small)
        textColor = Configuration.color.textPrimary
    }
    
}
