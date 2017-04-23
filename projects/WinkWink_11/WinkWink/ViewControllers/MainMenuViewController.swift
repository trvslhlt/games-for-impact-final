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
    var scene: MainMenuScene?
    var timer: Timer!
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(r: 183, g: 255, b: 220, a: 255)
        scene = MainMenuScene(size: sceneView.bounds.size)
        scene?.sceneDelegate = self
        if let scene = scene {
            sceneView.presentScene(scene)
        }
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        sceneView.alpha = 0
        UIView.animate(withDuration: 1) {
            self.sceneView.alpha = 1
        }
    }
    
    @IBAction func settingsTapped(_ sender: Any) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SettingsViewController") as! SettingsViewController
        present(vc, animated: true, completion: nil)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        scene?.size = sceneView.bounds.size
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
    
    func mainMenuSceneDidSelectTrophies() {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "TrophyRoomViewController") as! TrophyRoomViewController
        present(vc, animated: true, completion: nil)
    }
    
}
