//
//  AppViewController.swift
//  WinkWink_11
//
//  Created by trvslhlt on 4/9/17.
//  Copyright © 2017 travis holt. All rights reserved.
//

import UIKit

class AppViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Configuration.color.backgroundPrimary
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }

}
