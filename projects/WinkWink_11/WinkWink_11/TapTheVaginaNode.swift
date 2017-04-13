//
//  TapTheVaginaNode.swift
//  WinkWink_11
//
//  Created by trvslhlt on 4/11/17.
//  Copyright © 2017 travis holt. All rights reserved.
//

import SpriteKit

class TapTheVaginaNode: ChallengeNode {
    
    let n = AppSpriteNode(color: UIColor.green, size: CGSize(width: 100, height: 400))
    
    override func commonInit() {
        super.commonInit()
        n.didTap = {
            self.stop()
        }
        addChild(n)
    }
    
    override func start() {
        print("TapTheVaginaNode:start")
    }
    
    override func stop() {
        print("TapTheVaginaNode:stop")
    }

}
