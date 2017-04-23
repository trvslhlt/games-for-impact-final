//
//  ChallengeResultInformationNode.swift
//  WinkWink
//
//  Created by trvslhlt on 4/23/17.
//  Copyright © 2017 travis holt. All rights reserved.
//

import UIKit

class ChallengeResultInformationNode: AppSpriteNode {
    
    let information: String
    var informationLabel: AppLabelNode!
    var containerNode = AppSpriteNode(color: .clear, size: CGSize(width: 300, height: 300))
    weak var delegate: ChallengeResultNodeDelegate?
    
    init(information: String) {
        self.information = information
        super.init(color: .clear, size: CGSize.zero)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func commonInit() {
        super.commonInit()
        addChild(containerNode)
        
        let labelNode = AppLabelNode(text: information)
        labelNode.fontSize = Configuration.font.size.small
        informationLabel = AppLabelNode.multipleLineText(labelInPut: labelNode)
        informationLabel.position = CGPoint(x: 0, y: 80)
        containerNode.addChild(informationLabel)
        
        let nextButtonNode = AppSpriteNode(color: .white, size: CGSize(width: 250, height: 50))
        nextButtonNode.position = CGPoint(x: 0, y: -80)
        nextButtonNode.didTap = {
            print("did tap next")
            self.delegate?.challengeResultDidComplete()
        }
        containerNode.addChild(nextButtonNode)
        
        let nextLabelNode = AppLabelNode(text: "NEXT")
        nextLabelNode.fontColor = Configuration.color.backgroundPrimary
        nextLabelNode.verticalAlignmentMode = .center
        nextButtonNode.addChild(nextLabelNode)
    }
    
    func start() {}
    
    func stop() {}
    
}
