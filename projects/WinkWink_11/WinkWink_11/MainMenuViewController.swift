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
        view.backgroundColor = Configuration.color.backgroundDark
        let scene = MainMenuScene(size: sceneView.bounds.size)
        scene.sceneDelegate = self
        sceneView.presentScene(scene)
    }
    
    @IBAction func settingsTapped(_ sender: Any) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SettingsViewController") as! SettingsViewController
        present(vc, animated: true, completion: nil)
    }
    
}

extension MainMenuViewController: MainMenuSceneDelegate {

    func mainMenuSceneDidSelectLevel(number: Int) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LevelViewController") as! LevelViewController
        vc.level = levelViewModel.level(number: number)
        present(vc, animated: true, completion: nil)
    }
    
    func mainMenuSceneDidSelectLinks() {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ExternalResourcesViewController") as! ExternalResourcesViewController
        present(vc, animated: true, completion: nil)
    }
    
    func mainMenuSceneDidSelectSettings() {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SettingsViewController") as! SettingsViewController
        present(vc, animated: true, completion: nil)
    }
    
}
