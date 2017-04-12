//
//  MainMenuViewController.swift
//  WinkWink_11
//
//  Created by trvslhlt on 4/8/17.
//  Copyright © 2017 travis holt. All rights reserved.
//

import UIKit

class MainMenuViewController: AppViewController {

    @IBOutlet weak var levelsButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Configuration.color.backgroundPrimary
        levelsButton.setTitleColor(Configuration.color.textPrimary, for: .normal)
    }

    @IBAction func playTapped(_ sender: Any) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LevelListViewController") as! LevelListViewController
        present(vc, animated: true, completion: nil)
    }
    
}
