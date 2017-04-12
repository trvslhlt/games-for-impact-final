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
    
    var level = 0
    var playScene: PlayScene?
    var resultScene: LevelResultScene?
    @IBOutlet weak var sceneView: SKView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showPlay()
    }

    func showPlay() {
        playScene = PlayScene(challengeNodes: [], size: sceneView.bounds.size)
        sceneView.presentScene(playScene)
        
    }
    
    func showResult() {
        resultScene = LevelResultScene(size: sceneView.bounds.size)
        sceneView.presentScene(resultScene)
    }
    
}


//class LevelViewController: AppViewController {
//        
//    @IBOutlet weak var playContainer: SKView!
//    var level = 0
//    var score: (scored: Float, possible: Float) = (0, 0)
//    var scenes: [PlayScene] = [VaginaScene(), BoobsNameScene()]
//    var currentScene: PlayScene?
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        playContainer.backgroundColor = Configuration.color.backgroundPrimary
//        playContainer.showsFPS = true
//        playContainer.showsNodeCount = true
//        playContainer.ignoresSiblingOrder = true
//
//        let swipe = UISwipeGestureRecognizer(target: self, action: #selector(LevelViewController.swipedLeft))
//        swipe.direction = .left
//        view.addGestureRecognizer(swipe)
//        showNextScene(transition: nil)
//    }
//    
//    func showNextScene(transition: SKTransition?) {
//        guard scenes.count > 0 else {
//            currentScene = nil
//            showLevelResult()
//            return
//        }
//        self.currentScene = scenes.remove(at: 0)
//        if let currentScene = self.currentScene {
//            currentScene.size = playContainer.bounds.size
//            currentScene.playSceneDelegate = self
//            if let trans = transition {
//                playContainer.presentScene(currentScene, transition: trans)
//            } else {
//                playContainer.presentScene(currentScene)
//            }
//        }
//    }
//    
//    func showLevelResult() {
//        let scene = LevelResultScene()
//        scene.level = "\(level)"
//        scene.score = "\(score.scored) / \(score.possible)"
//        scene.size = playContainer.bounds.size
//        playContainer.presentScene(scene, transition: Configuration.transition.defaultTransition)
//    }
//    
//    func swipedLeft() {
//        if let currentScene = self.currentScene {
//            currentScene.didReceiveSubmissionEvent()
//        }
//    }
//    
//    @IBAction func exitTapped(_ sender: Any) {
//        dismiss(animated: true, completion: nil)
//    }
//    
//}
//
//extension LevelViewController: PlaySceneDelegate {
//
//    func playSceneDone(scene: SKScene) {
//        showNextScene(transition: Configuration.transition.defaultTransition)
//    }
//    
//    func playScenePointsScored(points: Float, ofPossible possible: Float) {
//        self.score = (self.score.scored + points, self.score.possible + possible)
//    }
//    
//}
