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
    private var vulvaNodes = [AppSpriteNode]()
    private let rows = 2
    private let columns = 3
    private var selectedVulvas = Set<AppSpriteNode>()
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
        
        for row in 0..<rows {
            for column in 0..<columns {
                let vulvaNode = AppSpriteNode(imageNamed: "trash")
                vulvaNode.didTap = {
                    let idx = (row * self.columns) + row
                    print("row: \(row), column: \(column), idx: \(idx)")
                    self.selectedVulvas.insert(vulvaNode)
                    if self.selectedVulvas.count == (self.rows * self.columns) {
                        self.didSubmitAnswer(correct: true)
                    }
                }
                optionsContainerNode.addChild(vulvaNode)
                vulvaNodes.append(vulvaNode)
            }
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
    
    override func didUpdate(parentSize: CGSize) {
        super.didUpdate(parentSize: parentSize)
        size = parentSize
        
        challengeLabelContainerNode.size = size.portionOf(w: 1, h: 0.2)
        optionsContainerNode.size = size.portionOf(w: 1, h: 0.6)
        submitNode.size = size.portionOf(w: 1, h: 0.2)
        
        challengeLabelContainerNode.position = size.pointAtPortion(x: 0, y: 0.4)
        optionsContainerNode.position = CGPoint.zero
        submitNode.position = size.pointAtPortion(x: 0, y: -0.4)
        
        let optionNodeSize = self.optionNodeSize()
        for row in 0..<rows {
            for column in 0..<columns {
                let idx = (rows * column) + row
                let node = vulvaNodes[idx]
                node.size = optionNodeSize
                node.anchorPoint = CGPoint(x: 0, y: 0)
                let nodeX = CGFloat(column) * optionNodeSize.width
                let nodeY = CGFloat(row) * optionNodeSize.height
                let nodePosition = CGPoint(x: nodeX, y: nodeY).offset(x: -1 * (optionsContainerNode.size.width / 2), y: -1 * (optionsContainerNode.size.height / 2))
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
        print("TapTheVagina:start")
    }
    
    override func stop() {
        print("TapTheVaginaNode:stop")
    }

}
