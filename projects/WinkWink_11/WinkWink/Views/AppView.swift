//
//  AppView.swift
//  WinkWink_11
//
//  Created by trvslhlt on 4/14/17.
//  Copyright © 2017 travis holt. All rights reserved.
//

import UIKit

class AppView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func commonInit() {
        self.backgroundColor = Configuration.color.backgroundPrimary
    }

}
