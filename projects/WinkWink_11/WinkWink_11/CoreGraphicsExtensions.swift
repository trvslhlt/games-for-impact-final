//
//  CoreGraphicsExtensions.swift
//  WinkWink_11
//
//  Created by trvslhlt on 4/11/17.
//  Copyright © 2017 travis holt. All rights reserved.
//

import CoreGraphics

extension CGPoint {
    
    func offset(x: CGFloat, y: CGFloat) -> CGPoint {
        return CGPoint(x: self.x + x, y: self.y + y)
    }

}

extension CGSize {

    func insetBy(dWidth: CGFloat, dHeight: CGFloat) -> CGSize {
        let newWidth = max(0, self.width - dWidth)
        let newHeight = max(0, self.height - dHeight)
        return CGSize(width: newWidth, height: newHeight)
    }
    
}
