//
//  PlayScene.swift
//  WinkWink_11
//
//  Created by trvslhlt on 4/9/17.
//  Copyright © 2017 travis holt. All rights reserved.
//

import SpriteKit

protocol PlaySceneDelegate: class {
    func playSceneDidCompleteWithResults(results: LevelResults)
}

class PlayScene: AppScene, ChallengeNodeDelegate, ChallengeResultNodeDelegate {

    private var challengeNodes: [ChallengeNode]
    var currentChallengeNode: ChallengeNode?
    var challengeResultNode: ChallengeResultNode?
    var score: (scored: Float, possible: Float) = (0, 0)
    
    
    init(challengeNodes: [ChallengeNode], size: CGSize) {
        self.challengeNodes = challengeNodes
        super.init(size: size)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didMove(to view: SKView) {
        super.didMove(to: view)
        start()
    }
    
    private func start() {
        guard currentChallengeNode == nil else { return }
        
        if challengeNodes.count == 0 {
            print("no challenges to play")
            return
        }
        startNextChallenge()
    }
    
    private func stop() {
        
        didComplete()
    }
    
    private func startNextChallenge() {
        guard challengeNodes.count > 0 else {
            stop()
            return
        }
        currentChallengeNode = challengeNodes.remove(at: 0)
        if let node = currentChallengeNode {
            node.size = CGSize(width: size.width, height: size.height)
            node.position = CGPoint(x: node.size.width / 2, y: node.size.height / 2)
            addChild(node)
            node.delegate = self
            node.start()
        }
    }
    
    private func showChallengeResult(node: ChallengeNode, correct: Bool) {
        node.stop()
        challengeResultNode = ChallengeResultNode(correct: correct)
        challengeResultNode!.position = CGPoint(x: size.width / 2, y: size.height / 2)
        challengeResultNode?.delegate = self
        addChild(challengeResultNode!)
    }
    
    private func hideChallengeResult() {
        challengeResultNode?.removeFromParent()
    }
    
    func challengeNodeDidComplete(node: ChallengeNode, correct: Bool) {
        print("didcomplete. correct: \(correct). points: \(correct ? node.potentialValue : 0)")
        showChallengeResult(node: node, correct: correct)
    }
    
    func challengeResultDidComplete() {
        hideChallengeResult()
        startNextChallenge()
    }
}
