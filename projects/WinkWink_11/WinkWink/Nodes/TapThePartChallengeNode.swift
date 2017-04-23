//
//  TapThePartChallengeNode.swift
//  WinkWink
//
//  Created by trvslhlt on 4/21/17.
//  Copyright © 2017 travis holt. All rights reserved.
//

import UIKit

class TapTheVulvaPartChallengeNode: ChallengeNode {

    let challengeInstructions: String
    let correctTapRects: [CGRect]
    
    let totalNode = AppSpriteNode(imageNamed: "vulva_composite")
    let correctNodes = [AppSpriteNode]()
    var instructionsNode: AppLabelNode!
    
    init(
        challengeInstructions: String,
        correctTapRects: [CGRect]) {
        self.challengeInstructions = challengeInstructions
        self.correctTapRects = correctTapRects
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func commonInit() {
        super.commonInit()
        
        totalNode.position = CGPoint.zero
        totalNode.didTap = {
            self.didSubmitAnswer(correct: false)
        }
        
        for rect in correctTapRects {
            let node = AppSpriteNode(color: .clear, size: rect.size)
            node.position = rect.origin
            node.color = .black
            node.didTap = {
                self.didSubmitAnswer(correct: true)
            }
            totalNode.addChild(node)
        }
        
        instructionsNode = AppLabelNode(text: challengeInstructions)
        instructionsNode.position = CGPoint(x: 0, y: 240)
        
        addChild(instructionsNode)
        addChild(totalNode)   
    }
    
    override func start() {}
    override func stop() {}
    
}
