//
//  TrophyRoomViewController.swift
//  WinkWink
//
//  Created by trvslhlt on 4/23/17.
//  Copyright © 2017 travis holt. All rights reserved.
//

import UIKit

class TrophyRoomViewController: AppViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(r: 247, g: 181, b: 180, a: 255)
    }
    
    @IBAction func tappedCancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

}
