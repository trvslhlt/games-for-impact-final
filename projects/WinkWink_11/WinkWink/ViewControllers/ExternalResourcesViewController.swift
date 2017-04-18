//
//  ExternalResourcesViewController.swift
//  WinkWink_11
//
//  Created by trvslhlt on 4/17/17.
//  Copyright © 2017 travis holt. All rights reserved.
//

import UIKit

class ExternalResourcesViewController: AppViewController {
    
    let linkPaths = ["https://www.plannedparenthood.org/"]
    
    @IBAction func tappedLink(_ sender: UIButton) {
        let url = URL(string: linkPaths[0])!
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }

    @IBAction func cancelTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
