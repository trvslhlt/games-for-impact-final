//
//  SplashViewController.swift
//  WinkWink_11
//
//  Created by trvslhlt on 4/10/17.
//  Copyright © 2017 travis holt. All rights reserved.
//

import UIKit

class SplashViewController: AppViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        imageView.loadGif(name: "splash_animation")
        
        UIView.animate(withDuration: 0.3) { 
            self.view.backgroundColor = Configuration.color.backgroundSecondary
        }
        
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MainMenuViewController") as! MainMenuViewController
        delay(duration: 3) {
            self.present(vc, animated: true, completion: nil)
        }
    }

}
