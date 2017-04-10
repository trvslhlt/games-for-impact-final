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


class PlayViewController: AppViewController {
        
    @IBOutlet weak var playContainer: SKView!
    var score: (scored: Float, possible: Float) = (0, 0)
    var scenes: [PlayScene] = [VaginaScene()]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        playContainer.backgroundColor = Configuration.color.backgroundPrimary
        playContainer.showsFPS = true
        playContainer.showsNodeCount = true
        playContainer.ignoresSiblingOrder = true

        let swipe = UISwipeGestureRecognizer(target: self, action: #selector(PlayViewController.swipedLeft))
        swipe.direction = .left
        view.addGestureRecognizer(swipe)
        showNextScene(transition: nil)
    }
    
    func showNextScene(transition: SKTransition?) {
        guard scenes.count > 0 else {
            showLevelResult()
            return
        }
        let scene = scenes.remove(at: 0)
        scene.size = playContainer.bounds.size
        scene.playSceneDelegate = self
        if let trans = transition {
            playContainer.presentScene(scene, transition: trans)
        } else {
            playContainer.presentScene(scene)
        }
    }
    
    func showLevelResult() {
        let scene = SKScene(fileNamed: "LevelResultScene")!
        scene.size = playContainer.bounds.size
        playContainer.presentScene(scene, transition: Configuration.transition.defaultTransition)
    }
    
    func swipedLeft() {
        if scenes.count > 0 {
            showNextScene(transition: Configuration.transition.defaultTransition)
        }
    }
    
    @IBAction func exitTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}

extension PlayViewController: PlaySceneDelegate {

    func playSceneDone(scene: SKScene) {
        showNextScene(transition: Configuration.transition.defaultTransition)
    }
    
    func playScenePointsScored(points: Float, ofPossible possible: Float) {
        self.score = (self.score.scored + points, self.score.possible + possible)
    }
    
}
