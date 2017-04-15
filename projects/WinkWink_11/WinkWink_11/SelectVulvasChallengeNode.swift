//
//  SelectVulvasChallengeNode.swift
//  WinkWink_11
//
//  Created by trvslhlt on 4/15/17.
//  Copyright © 2017 travis holt. All rights reserved.
//

import UIKit

class SelectVulvasChallengeNode: ChallengeNode {

    let containerNode = AppSpriteNode(color: .green, size: CGSize.zero)
    
    override func commonInit() {
        super.commonInit()
        potentialValue = 50
        containerNode.didTap = {
            self.didSubmitAnswer(correct: true)
        }
        addChild(containerNode)
    }
    
    override func didUpdate(parentSize: CGSize) {
        super.didUpdate(parentSize: parentSize)
        containerNode.size = parentSize
    }
    
    override func start() {
        print("TapTheVagina:start")
    }
    
    override func stop() {
        print("TapTheVaginaNode:stop")
    }

}
