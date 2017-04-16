//
//  NavigationView.swift
//  WinkWink_11
//
//  Created by trvslhlt on 4/11/17.
//  Copyright © 2017 travis holt. All rights reserved.
//

import UIKit

protocol NavigationViewDelegate: class {
    func navigationRightCancelTapped()
}

class NavigationView: AppView {
    
    weak var delegate: NavigationViewDelegate?
    private let rightControl = CancelButton()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    override func commonInit() {
        super.commonInit()
        backgroundColor = Configuration.color.backgroundSecondary
        rightControl.addTarget(self, action: #selector(NavigationView.didTapRightControl), for: .touchUpInside)
        
        addSubview(rightControl)
        rightControl.translatesAutoresizingMaskIntoConstraints = false
        let rightControlDimension = Configuration.layout.navigationHeight - Configuration.layout.paddingDefault * 2
        let centerY = NSLayoutConstraint(item: rightControl,
                                         attribute: NSLayoutAttribute.centerY,
                                         relatedBy: NSLayoutRelation.equal,
                                         toItem: self,
                                         attribute: NSLayoutAttribute.centerY,
                                         multiplier: 1, constant: 0)
        
        let width = NSLayoutConstraint(item: rightControl,
                                       attribute: NSLayoutAttribute.width,
                                       relatedBy: NSLayoutRelation.equal,
                                       toItem: nil,
                                       attribute: NSLayoutAttribute.notAnAttribute,
                                       multiplier: 1,
                                       constant: rightControlDimension)
        let height = NSLayoutConstraint(item: rightControl,
                                       attribute: NSLayoutAttribute.height,
                                       relatedBy: NSLayoutRelation.equal,
                                       toItem: nil,
                                       attribute: NSLayoutAttribute.notAnAttribute,
                                       multiplier: 1,
                                       constant: rightControlDimension)
        let rightSpacing = NSLayoutConstraint(item: rightControl,
                                              attribute: NSLayoutAttribute.right,
                                              relatedBy: NSLayoutRelation.equal,
                                              toItem: self,
                                              attribute: NSLayoutAttribute.right,
                                              multiplier: 1,
                                              constant: -Configuration.layout.paddingDefault)
        addConstraints([centerY, width, height, rightSpacing])
    }
    
    func didTapRightControl() {
        delegate?.navigationRightCancelTapped()
    }

}
