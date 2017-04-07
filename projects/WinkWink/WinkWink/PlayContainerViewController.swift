//
//  PlayContainerViewController.swift
//  WinkWink
//
//  Created by trvslhlt on 4/7/17.
//  Copyright © 2017 travis holt. All rights reserved.
//

import UIKit

protocol ContentViewControllerDelegate: class {
    func didSwipeLeft()
}

class PlayContainerViewController: UIViewController {
    
    @IBOutlet weak var childContainer: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let facesViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "FacesViewController") as! FacesViewController
        facesViewController.delegate = self
        add(asChildViewController: facesViewController)
    }

    @IBAction func backTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    private func add(asChildViewController viewController: UIViewController) {
        addChildViewController(viewController)
        childContainer.addSubview(viewController.view)
        viewController.view.frame = childContainer.bounds
        viewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        viewController.didMove(toParentViewController: self)
    }
    
}

extension PlayContainerViewController: ContentViewControllerDelegate {
    
    func didSwipeLeft() {
        print("didSwipeLeft")
    }
    
}
