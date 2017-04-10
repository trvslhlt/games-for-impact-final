//
//  BoobsNameScene.swift
//  WinkWink_11
//
//  Created by trvslhlt on 4/10/17.
//  Copyright © 2017 travis holt. All rights reserved.
//

import UIKit
import SpriteKit

class BoobsPreferenceScene: PlayScene {
    
    override func didMove(to view: SKView) {
        super.didMove(to: view)
        possiblePoints = 10
        showChallenge(view: view)
    }
    
    func showChallenge(view: SKView) {
        challengeNode.size = view.bounds.size
        challengeNode.position = CGPoint.zero
        challengeNode.anchorPoint = CGPoint.zero
        addChild(challengeNode)

        let textNode = SKLabelNode(text: "Whatcha wanna call them?")
        textNode.position = CGPoint(x: challengeNode.size.width / 2, y: challengeNode.size.height / 2 + 200)
        challengeNode.addChild(textNode)

        let boobsContainer = SKSpriteNode()
        boobsContainer.position = CGPoint(x: 0, y: 200)
        boobsContainer.color = .green
        boobsContainer.size = CGSize(width: challengeNode.size.width, height: 300)
        boobsContainer.anchorPoint = CGPoint.zero
        challengeNode.addChild(boobsContainer)
        
        let columns = 2
        let rows = 3
        let boobsWidth = boobsContainer.size.width / CGFloat(columns)
        let boobsHeight = boobsContainer.size.height / CGFloat(rows)
        for row in 0..<rows {
            for col in 0..<columns {
                let boobsNumber = (row * col) + col
                
                let boobsNode = SKSpriteNode(imageNamed: "confetti")
                boobsNode.name = "\(boobsNumber)"
                boobsNode.anchorPoint = CGPoint.zero
                boobsNode.position = CGPoint(x: boobsWidth * CGFloat(col), y: boobsHeight * CGFloat(row))
                boobsNode.size = CGSize(width: boobsWidth, height: boobsHeight)
                boobsNode.color = .red
                boobsContainer.addChild(boobsNode)
            }
        }
    }
    
    func handleSubmission(correct: Bool) {
        playSceneDelegate?.playScenePointsScored(points: correct ? possiblePoints : 0, ofPossible: possiblePoints)
        challengeNode.removeFromParent()
        showResult(view: self.view!, correct: correct)
    }
    
    func showResult(view: SKView, correct: Bool) {
        resultNode.size = view.bounds.size
        resultNode.position = view.center
        addChild(resultNode)
        
        let successText = SKLabelNode(text: correct ? "GREAT!" : "NOPE")
        successText.fontSize = 150
        successText.position = CGPoint.zero
        resultNode.addChild(successText)
        done()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        guard let touch = touches.first else { return }
//        let positionInScene = touch.location(in: self)
//        if let touchedNode = nodes(at: positionInScene).first, let name = touchedNode.name {
//            run(Configuration.sound.defaultSound)
//            if name == vagina {
//                handleSubmission(correct: true)
//            } else if name == vulva {
//                handleSubmission(correct: false)
//            }
//        }
    }
    
    func done() {
        delay(duration: Configuration.time.defaultDuration) {
            self.playSceneDelegate?.playSceneDone(scene: self)
        }
    }
    
}
