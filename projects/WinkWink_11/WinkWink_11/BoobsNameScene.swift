//
//  BoobsNameScene.swift
//  WinkWink_11
//
//  Created by trvslhlt on 4/10/17.
//  Copyright © 2017 travis holt. All rights reserved.
//

import UIKit

//
//  BoobsNameScene.swift
//  WinkWink_11
//
//  Created by trvslhlt on 4/10/17.
//  Copyright © 2017 travis holt. All rights reserved.
//

import UIKit
import SpriteKit

//class BoobsNameScene: PlayScene {
//    
//    let nameOptions = ["boobs", "breasts", "tatas", "tits", "tetas"]
//    var selectedNodes = Set<SKLabelNode>()
//    var elementNodes = [SKLabelNode]()
//    
//    override func didMove(to view: SKView) {
//        super.didMove(to: view)
//        possiblePoints = 10
//        showChallenge(view: view)
//    }
//    
//    func showChallenge(view: SKView) {
//        challengeNode.size = view.bounds.size
//        challengeNode.position = CGPoint.zero
//        challengeNode.anchorPoint = CGPoint.zero
//        addChild(challengeNode)
//        
//        let textNode = SKLabelNode(text: "Whatcha wanna call them?")
//        textNode.position = CGPoint(x: challengeNode.size.width / 2, y: challengeNode.size.height / 2 + 200)
//        challengeNode.addChild(textNode)
//        
//        let elementContainer = SKSpriteNode()
//        elementContainer.position = CGPoint(x: 0, y: 200)
//        elementContainer.size = CGSize(width: challengeNode.size.width, height: 300)
//        elementContainer.anchorPoint = CGPoint.zero
//        challengeNode.addChild(elementContainer)
//        
//        let elementHeight = elementContainer.size.height / CGFloat(nameOptions.count)
//        for (idx, nameOption) in nameOptions.enumerated() {
//            let elementNode = SKLabelNode(text: nameOption)
//            elementNode.name = nameOption
//            elementNode.position = CGPoint(x: elementContainer.size.width / 2, y: elementHeight * CGFloat(idx))
//            elementContainer.addChild(elementNode)
//            elementNodes.append(elementNode)
//        }
//    }
//    
////    override func didReceiveSubmissionEvent() {
////        let correct = true
////        playSceneDelegate?.playScenePointsScored(points: correct ? possiblePoints : 0, ofPossible: possiblePoints)
////        challengeNode.removeFromParent()
////        showResult(view: self.view!, correct: correct)
////    }
//    
//    func showResult(view: SKView, correct: Bool) {
//        resultNode.size = view.bounds.size
//        resultNode.position = view.center
//        addChild(resultNode)
//        
//        let successText = SKLabelNode(text: correct ? "GREAT!" : "NOPE")
//        successText.fontSize = 150
//        successText.position = CGPoint.zero
//        resultNode.addChild(successText)
//        done()
//    }
//    
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        guard let touch = touches.first else { return }
//        let positionInScene = touch.location(in: self)
//        if let touchedNode = nodes(at: positionInScene).first as? SKLabelNode, let name = touchedNode.name {
//            run(Configuration.sound.defaultSound)
//            if nameOptions.contains(name) {
//                if selectedNodes.contains(touchedNode) {
//                    selectedNodes.remove(touchedNode)
//                    touchedNode.fontColor = .white
//                } else {
//                    selectedNodes.insert(touchedNode)
//                    touchedNode.fontColor = .blue
//                }
//            }
//        }
//    }
//    
//    func done() {
//        delay(duration: Configuration.time.defaultDuration) {
//            self.playSceneDelegate?.playSceneDone(scene: self)
//        }
//    }
//    
//}
