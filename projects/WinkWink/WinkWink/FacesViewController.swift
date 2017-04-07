//
//  FacesViewController.swift
//  WinkWink
//
//  Created by trvslhlt on 4/7/17.
//  Copyright © 2017 travis holt. All rights reserved.
//

import UIKit

class FacesViewController: UIViewController {

    weak var delegate: ContentViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.black
        let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(FacesViewController.didSwipeLeft))
        leftSwipe.direction = .left
        view.addGestureRecognizer(leftSwipe)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        UIView.animate(withDuration: 0.5) { 
            self.view.backgroundColor = UIColor.green
        }
    }
    
    func didSwipeLeft() {
        delegate?.didSwipeLeft()
    }

}
