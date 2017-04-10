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
        imageView.loadGif(name: "splash_animation")
        imageView.tintColor = .green
        delay(duration: 3) { 
            let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MainMenuViewController") as! MainMenuViewController
            self.present(vc, animated: true, completion: nil)
        }
    }

}
