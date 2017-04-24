//
//  GameViewController.swift
//  WinkWink_11
//
//  Created by trvslhlt on 4/7/17.
//  Copyright © 2017 travis holt. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit


class LevelViewController: AppViewController {
    
    var level: Level!
    var levelResult: LevelResult?
    var playScene: PlayScene?
    var resultScene: LevelResultScene?
    @IBOutlet weak var sceneView: SKView!
    @IBOutlet weak var statusView: LevelStatusView!
    
    var sceneSize: CGSize { return sceneView.bounds.size }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showPlay()
    }

    func showPlay() {
        playScene = PlayScene(level: level, size: sceneSize)
        playScene?.playSceneDelegate = self
        statusView.setChallengeCount(level.challenges.count)
        sceneView.presentScene(playScene)
        view.setNeedsDisplay()
    }
    
    func showResult() {
        guard let result = levelResult else { fatalError("no level result to present") }
        resultScene = LevelResultScene(levelResult: result, size: sceneSize)
        resultScene?.sceneDelegate = self
        sceneView.presentScene(resultScene)
        view.setNeedsDisplay()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        playScene?.size = sceneSize
    }
    
}

extension LevelViewController: LevelResultSceneDelegate {

    func levelResultDidComplete() {
        dismiss(animated: true, completion: nil)
    }
    
}

extension LevelViewController: PlaySceneDelegate {
    
    func playSceneDidCompleteWithResult(result: LevelResult) {
        self.levelResult = result
        showResult()
    }
    
    func playSceneDidUpdateElapsedTime(progress: Float) {
        statusView.set(progress: progress)
    }
    
    func playSceneDidBeginChallenge(_ challenge: Int) {
        statusView.setChallenge(number: challenge)
    }
}

