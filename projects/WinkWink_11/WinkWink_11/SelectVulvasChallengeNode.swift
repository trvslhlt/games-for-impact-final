//
//  SelectVulvasChallengeNode.swift
//  WinkWink_11
//
//  Created by trvslhlt on 4/15/17.
//  Copyright © 2017 travis holt. All rights reserved.
//

import UIKit

class SelectVulvasChallengeNode: ChallengeNode {

    private let containerNode = AppSpriteNode(color: .clear, size: CGSize.zero)
    private var vulvaNodes = [AppSpriteNode]()
    private let rows = 2
    private let columns = 3
    private var selectedVulvas = Set<AppSpriteNode>()
    
    override func commonInit() {
        super.commonInit()
        potentialValue = 50
        containerNode.didTap = {
            self.didSubmitAnswer(correct: true)
        }
        
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
                containerNode.addChild(vulvaNode)
                vulvaNodes.append(vulvaNode)
            }
        }
        addChild(containerNode)
    }
    
    override func didUpdate(parentSize: CGSize) {
        super.didUpdate(parentSize: parentSize)
        containerNode.size = parentSize
        let containerBottomLeftPoint = CGPoint(
            x: -(containerNode.size.width / 2),
            y: -(containerNode.size.height / 2))
        let vulvaNodeWidth: CGFloat = containerNode.size.width / CGFloat(columns)
        let vulvaNodeHeight: CGFloat = containerNode.size.height / CGFloat(rows)
        let vulvaNodeSize = CGSize(width: vulvaNodeWidth, height: vulvaNodeHeight)
        for row in 0..<rows {
            for column in 0..<columns {
                let idx = (rows * column) + row
                let node = vulvaNodes[idx]
                node.size = vulvaNodeSize
                node.anchorPoint = CGPoint(x: 0, y: 0)
                let nodeX = CGFloat(column) * vulvaNodeWidth
                let nodeY = CGFloat(row) * vulvaNodeHeight
                let nodePosition = CGPoint(x: nodeX, y: nodeY)
                    .offset(x: containerBottomLeftPoint.x, y: containerBottomLeftPoint.y)
                node.position = nodePosition
            }
        }
    }
    
    override func start() {
        print("TapTheVagina:start")
    }
    
    override func stop() {
        print("TapTheVaginaNode:stop")
    }

}
