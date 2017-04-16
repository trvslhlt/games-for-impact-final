//
//  MainMenuViewController.swift
//  WinkWink_11
//
//  Created by trvslhlt on 4/8/17.
//  Copyright © 2017 travis holt. All rights reserved.
//

import UIKit
import SpriteKit

class MainMenuViewController: AppViewController {

    @IBOutlet weak var sceneView: SKView!
    let levelViewModel = LevelViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let scene = MainMenuScene(size: sceneView.bounds.size)
        scene.sceneDelegate = self
        sceneView.presentScene(scene)
    }
    
}

extension MainMenuViewController: MainMenuSceneDelegate {

    func mainMenuSceneDidSelectLevel(number: Int) {
        
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LevelViewController") as! LevelViewController
        vc.level = levelViewModel.level(number: number)
        present(vc, animated: true, completion: nil)
    }
    
}
