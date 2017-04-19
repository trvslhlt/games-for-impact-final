//
//  PlayScene.swift
//  WinkWink_11
//
//  Created by trvslhlt on 4/9/17.
//  Copyright © 2017 travis holt. All rights reserved.
//

import SpriteKit

protocol PlaySceneDelegate: class {
    func playSceneDidCompleteWithResult(result: LevelResult)
    func playSceneDidUpdateElapsedTime(progress: Float)
    func playSceneDidBeginChallenge(_ challenge: Int)
}

class PlayScene: AppScene, ChallengeNodeDelegate, ChallengeResultNodeDelegate {

    private let level: Level
    private var challengeNodes: [ChallengeNode]
    var currentChallengeNode: ChallengeNode?
    var challengeResultNode: ChallengeResultNode?
    var score: (earned: Float, possible: Float) = (0, 0)
    var marks: (correct: Int, possible: Int) = (0, 0)
    var elapsedTime: TimeInterval = 0
    var challenge = 0
    let timer = LevelTimer()
    weak var playSceneDelegate: PlaySceneDelegate?
    
    
    init(level: Level, size: CGSize) {
        self.challengeNodes = level.challenges
        self.level = level
        super.init(size: size)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didMove(to view: SKView) {
        super.didMove(to: view)
        start()
        timer.didUpdateElapsedTime = { elapsedTime in
            self.elapsedTime = elapsedTime
            let progress = Float((self.level.timeLimit - elapsedTime) / self.level.timeLimit)
            self.playSceneDelegate?.playSceneDidUpdateElapsedTime(progress: progress)
        }
    }
    
    override func didChangeSize(_ oldSize: CGSize) {
        challengeNodes.forEach { $0.didUpdate(parentSize: size) }
        if let node = currentChallengeNode {
            node.didUpdate(parentSize: size)
        }
    }
    
    private func start() {
        guard currentChallengeNode == nil else { return }
        if challengeNodes.count == 0 {
            return
        }
        startNextChallenge()
    }
    
    private func stop() {
        let portionOfTimeRemaining = Float((level.timeLimit - elapsedTime) / level.timeLimit)
        let timeAdjustedScore = score.earned * portionOfTimeRemaining
        let result = LevelResult(
            level: level,
            score: (timeAdjustedScore, score.possible),
            marks: marks,
            timeElapsed: elapsedTime)
        self.playSceneDelegate?.playSceneDidCompleteWithResult(result: result)
    }
    
    private func startNextChallenge() {
        guard challengeNodes.count > 0 else {
            stop()
            return
        }
        currentChallengeNode = challengeNodes.remove(at: 0)
        playSceneDelegate?.playSceneDidBeginChallenge(challenge)
        challenge += 1
        if let node = currentChallengeNode {
            node.size = size
            node.position = CGPoint(x: node.size.width / 2, y: node.size.height / 2)
            addChild(node)
            node.delegate = self
            node.start()
            timer.unpause()
        }
    }
    
    private func showChallengeResult(node: ChallengeNode, correct: Bool) {
        node.stop()
        timer.pause()
        challengeResultNode = ChallengeResultNode(correct: correct)
        challengeResultNode!.position = CGPoint(x: size.width / 2, y: size.height / 2)
        challengeResultNode?.delegate = self
        addChild(challengeResultNode!)
        challengeResultNode?.start()
    }
    
    private func hideChallengeResult() {
        challengeResultNode?.stop()
        challengeResultNode?.removeFromParent()
    }
    
    func challengeNodeDidComplete(node: ChallengeNode, correct: Bool) {
        let challengePossible = node.potentialValue
        let challengeEarned = challengePossible * (correct ? 1 : 0)
        score = (score.earned + challengeEarned, score.possible + challengePossible)
        marks = (marks.correct + (correct ? 1 : 0), challengeNodes.count)
        let fade = SKAction.fadeOut(withDuration: Configuration.time.defaultDuration)
        let remove = SKAction.customAction(withDuration: 0) { _, _ in
            node.removeFromParent()
        }
        node.run(SKAction.sequence([fade, remove]))
        showChallengeResult(node: node, correct: correct)
    }
    
    func challengeResultDidComplete() {
        hideChallengeResult()
        startNextChallenge()
    }
}
