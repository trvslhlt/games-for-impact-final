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


class PlayViewController: UIViewController {
        
    @IBOutlet weak var playContainer: SKView!

    var firstScene: VaginaScene {
        let scene = VaginaScene(size: playContainer.bounds.size)
        scene.scaleMode = .resizeFill
        return scene
    }
    
    var secondScene: SKScene {
        let scene = TrashScene(size: view.bounds.size)
        scene.scaleMode = .resizeFill
        return scene
    }
    
    var currentScene: SKScene!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        playContainer.backgroundColor = Configuration.color.backgroundMain
        playContainer.showsFPS = true
        playContainer.showsNodeCount = true
        playContainer.ignoresSiblingOrder = true
        let scene = firstScene
        scene.sceneDelegate = self
        playContainer.presentScene(scene)
        currentScene = scene
        let swipe = UISwipeGestureRecognizer(target: self, action: #selector(PlayViewController.swipedLeft))
        swipe.direction = .left
        view.addGestureRecognizer(swipe)
    }
    
    func swipedLeft() {
        print("swipe")
        let transition = SKTransition.crossFade(withDuration: 2)
        currentScene.view?.presentScene(secondScene, transition: transition)
    }
    
    @IBAction func exitTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
}

extension PlayViewController: SceneDelegate {

    func sceneDone(scene: SKScene) {
        let transition = SKTransition.fade(with: Configuration.color.backgroundMain, duration: 2)
        currentScene.view?.presentScene(secondScene, transition: transition)
    }
    
}
