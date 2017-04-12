//
//  CancelButton.swift
//  WinkWink_11
//
//  Created by trvslhlt on 4/11/17.
//  Copyright © 2017 travis holt. All rights reserved.
//

import UIKit

class CancelButton: UIButton {
    
    private let imageFilename = "x"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

    private func commonInit() {
        setImage(UIImage(named: imageFilename), for: .normal)
        tintColor = Configuration.color.textPrimary
    }

}
