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
    @IBOutlet weak var navigationView: NavigationView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationView.delegate = self
        showPlay()
    }

    func showPlay() {
        let challengeNodes = [
            TapTheVaginaNode(),
            TapTheVaginaNode()
        ]
        playScene = PlayScene(challengeNodes: challengeNodes, size: sceneView.bounds.size)
        sceneView.presentScene(playScene)
    }
    
    func showResult() {
        resultScene = LevelResultScene(size: sceneView.bounds.size)
        sceneView.presentScene(resultScene)
    }
    
}

extension LevelViewController: NavigationViewDelegate {
    
    func navigationRightCancelTapped() {
        dismiss(animated: true, completion: nil)
    }
    
}
