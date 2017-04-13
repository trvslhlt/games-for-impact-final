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
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MainMenuViewController") as! MainMenuViewController
        let afterWink = {
            UIView.animate(withDuration: Configuration.time.defaultDuration, animations: {
                self.view.backgroundColor = Configuration.color.backgroundPrimary
            }) { _ in
                self.present(vc, animated: false, completion: nil)
            }
        }
        delay(duration: 2.5) {
            afterWink()
        }
    }

}
