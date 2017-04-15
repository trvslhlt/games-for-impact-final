//
//  SelectVulvasChallengeNode.swift
//  WinkWink_11
//
//  Created by trvslhlt on 4/15/17.
//  Copyright © 2017 travis holt. All rights reserved.
//

import UIKit

class SelectVulvasChallengeNode: ChallengeNode {

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
        optionsContainerNode.color = .red
        for row in 0..<rows {
            for column in 0..<columns {
                let vulvaNode = AppSpriteNode(imageNamed: "trash")
                vulvaNode.didTap = {
                    let idx = (row * self.columns) + row
                    print("row: \(row), column: \(column), idx: \(idx)")
                    vulvaNode.color = .green
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
        
        submitNode.color = .green
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
        submitNode.size = CGSize(width: size.width, height: submitNodeHeight)
        optionsContainerNode.size = parentSize.insetBy(dWidth: 0, dHeight: submitNodeHeight)
        submitNode.position = submitNodePosition()
        optionsContainerNode.position = optionsContainerPosition()
        
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
    
    private func bottomLeftPoint() -> CGPoint {
        return CGPoint(x: -1 * (size.width / 2), y: -1 * (size.height / 2))
    }
    
    private func submitNodePosition() -> CGPoint {
        return bottomLeftPoint().offset(x: submitNode.size.width / 2, y: submitNode.size.height / 2)
    }
    
    private func optionsContainerPosition() -> CGPoint {
        let a = bottomLeftPoint().offset(x: optionsContainerNode.size.width / 2, y: optionsContainerNode.size.height / 2)
        return a.offset(x: 0, y: submitNode.size.height)
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
