//
//  VaginaScene.swift
//  WinkWink_11
//
//  Created by trvslhlt on 4/8/17.
//  Copyright © 2017 travis holt. All rights reserved.
//

import SpriteKit

class VaginaScene: PlayScene {

    let vagina = "vagina"
    let vulva = "vulva"
    var correctGuess = false
    
    override func didMove(to view: SKView) {
        super.didMove(to: view)
        possiblePoints = 10
        showChallenge(view: view)
    }
    
    func showChallenge(view: SKView) {
        challengeNode.size = view.bounds.size
        challengeNode.position = view.center
        addChild(challengeNode)
        
        let vulvaNode = SKSpriteNode(imageNamed: "vulvaDrawing")
        vulvaNode.position = CGPoint.zero
        vulvaNode.name = vulva
        vulvaNode.size = CGSize(width: 200, height: 200)
        vulvaNode.color = .white
        challengeNode.addChild(vulvaNode)
        
        let vaginaNode = SKSpriteNode()
        vaginaNode.name = vagina
        vaginaNode.size = CGSize(width: 40, height: 40)
        vaginaNode.position = CGPoint(x: vulvaNode.position.x, y: vulvaNode.position.y - 40)
        vulvaNode.addChild(vaginaNode)

        let textNode = SKLabelNode(text: "Tap the vagina.")
        textNode.position = CGPoint(x: 0, y: 200)
        challengeNode.addChild(textNode)
    }
    
    override func didReceiveSubmissionEvent() {
        playSceneDelegate?.playScenePointsScored(points: correctGuess ? possiblePoints : 0, ofPossible: possiblePoints)
        challengeNode.removeFromParent()
        showResult(view: self.view!, correct: correctGuess)
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
        guard let touch = touches.first else { return }
        let positionInScene = touch.location(in: self)
        if let touchedNode = nodes(at: positionInScene).first as? SKSpriteNode, let name = touchedNode.name {
            run(Configuration.sound.defaultSound)
            if name == vagina {
                correctGuess = true
                touchedNode.color = .green
                touchedNode.colorBlendFactor = 0.5
            } else if name == vulva {
                correctGuess = false
                touchedNode.color = .green
                touchedNode.colorBlendFactor = 0.5
            }
        }
    }
    
    func done() {
        delay(duration: Configuration.time.defaultDuration) { 
            self.playSceneDelegate?.playSceneDone(scene: self)
        }
    }

}
