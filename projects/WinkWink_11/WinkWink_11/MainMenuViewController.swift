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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let scene = MainMenuScene(size: sceneView.bounds.size)
        sceneView.presentScene(scene)
    }

    @IBAction func playTapped(_ sender: Any) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LevelListViewController") as! LevelListViewController
        present(vc, animated: true, completion: nil)
    }
    
}
