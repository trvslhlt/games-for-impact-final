//
//  AppLabelNode.swift
//  WinkWink_11
//
//  Created by trvslhlt on 4/10/17.
//  Copyright © 2017 travis holt. All rights reserved.
//

import SpriteKit

class AppLabelNode: SKLabelNode {
    
    override init() {
        super.init()
        commonInit()
    }
    
    init(text: String) {
        super.init()
        self.text = text
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func commonInit() {
        fontSize = Configuration.font.size.regular
        fontColor = Configuration.color.textPrimary
    }

}
