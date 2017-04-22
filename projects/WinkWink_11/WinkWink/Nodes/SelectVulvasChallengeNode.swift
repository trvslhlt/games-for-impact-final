//
//  SelectVulvasChallengeNode.swift
//  WinkWink_11
//
//  Created by trvslhlt on 4/15/17.
//  Copyright © 2017 travis holt. All rights reserved.
//

import UIKit

class SelectVulvasChallengeNode: ChallengeNode {

    private let challengeLabelContainerNode = AppSpriteNode()
    private let optionsContainerNode = AppSpriteNode(color: .clear, size: CGSize.zero)
    private var optionNodes = [AppSpriteNode]()
    private let rows = 2
    private let columns = 2
    private var selectedOptions = Set<AppSpriteNode>()
    private let submitNode = AppSpriteNode()
    private let submitNodeHeight: CGFloat = 50
    
    override func commonInit() {
        super.commonInit()
        potentialValue = 50
        
        var challengeLabelNode = AppLabelNode(text: "Select all of the\nnormal looking vulvas")
        challengeLabelNode = AppLabelNode.multipleLineText(labelInPut: challengeLabelNode)
        challengeLabelNode.verticalAlignmentMode = .center
        challengeLabelContainerNode.addChild(challengeLabelNode)
        addChild(challengeLabelContainerNode)
        
        for i in 0..<(rows * columns) {
            let optionNode = getNewOptionNode(imageName: "normal_vulva_0\(i)" )
            optionsContainerNode.addChild(optionNode)
            optionNodes.append(optionNode)
        }
        addChild(optionsContainerNode)
        
        submitNode.didTap = {
            self.didSubmitAnswer(correct: false)
        }
        let submitLabel = AppLabelNode(text: "Next >>>")
        submitLabel.verticalAlignmentMode = .center
        submitNode.addChild(submitLabel)
        addChild(submitNode)
    }
    
    private func getNewOptionNode(imageName: String?) -> AppSpriteNode {
        let optionNode = AppSpriteNode(color: .clear, size: CGSize.zero)
        
        let vulvaNode: AppSpriteNode
        if let name = imageName {
            vulvaNode = AppSpriteNode(imageNamed: name)
        } else {
            vulvaNode = AppSpriteNode(color: .green, size: CGSize(width: 50, height: 50))
        }
        vulvaNode.position = optionNode.size.centerPoint()
        optionNode.addChild(vulvaNode)
        optionNode.didTap = {
            optionNode.alpha = 0.5
            self.selectedOptions.insert(vulvaNode)
            if self.selectedOptions.count == (self.rows * self.columns) {
                self.didSubmitAnswer(correct: true)
            }
        }
        return optionNode
    }
    
    override func didUpdate(parentSize: CGSize) {
        super.didUpdate(parentSize: parentSize)
        size = parentSize
        
        challengeLabelContainerNode.size = size.portionOf(w: 1, h: 0.2)
        optionsContainerNode.size = size.portionOf(w: 0.8, h: 0.6)
        submitNode.size = size.portionOf(w: 1, h: 0.2)
        
        challengeLabelContainerNode.position = size.pointAtPortion(x: 0, y: 0.4)
        optionsContainerNode.position = CGPoint.zero
        submitNode.position = size.pointAtPortion(x: 0, y: -0.4)
        
        let optionNodeSize = self.optionNodeSize()
        let origin = CGPoint(x: -1 * (optionsContainerNode.size.width / 2), y: -1 * (optionsContainerNode.size.height / 2))
        let optionNodeCenterInset = CGPoint(x: optionNodeSize.width / 2, y: optionNodeSize.height / 2)
        for row in 0..<rows {
            for column in 0..<columns {
                let idx = (rows * column) + row
                let node = optionNodes[idx]
                node.size = optionNodeSize
                let positionalOffset = CGPoint(
                    x: optionNodeSize.width * CGFloat(column), y: optionNodeSize.height * CGFloat(row))
                let nodePosition = origin + optionNodeCenterInset + positionalOffset
                node.position = nodePosition
            }
        }
    }
    
    private func optionNodeSize() -> CGSize {
        let nodeWidth: CGFloat = optionsContainerNode.size.width / CGFloat(columns)
        let nodeHeight: CGFloat = optionsContainerNode.size.height / CGFloat(rows)
        return CGSize(width: nodeWidth, height: nodeHeight)
    }
    
    override func start() {
        print("Vulva:start")
    }
    
    override func stop() {
        print("Vulva:stop")
    }

}
