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
        view.backgroundColor = UIColor(r: 183, g: 255, b: 220, a: 255)
        imageView.loadGif(name: "splash_logo")
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MainMenuViewController") as! MainMenuViewController
        
        let afterWink = {
            UIView.animate(withDuration: 1, animations: {
                self.imageView.alpha = 0
            }, completion: { _ in
                self.present(vc, animated: false, completion: nil)
            })
        }
        delay(duration: 5) {
            afterWink()
        }
    }

}
