//
//  ExternalResourceCollectionViewCell.swift
//  WinkWink
//
//  Created by trvslhlt on 4/23/17.
//  Copyright © 2017 travis holt. All rights reserved.
//

import UIKit

class ExternalResourceCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView?
    @IBOutlet weak var titleLabel: AppLabel?
    @IBOutlet weak var infoTextView: UITextView?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        titleLabel?.textColor = .black
        infoTextView?.textColor = .black
    }
    
}
