//
//  AppLabelNode.swift
//  WinkWink_11
//
//  Created by trvslhlt on 4/10/17.
//  Copyright © 2017 travis holt. All rights reserved.
//

import SpriteKit

class AppLabelNode: SKLabelNode {
    
    override init() {
        super.init()
        commonInit()
    }
    
    init(text: String) {
        super.init()
        self.text = text
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    override init(fontNamed fontName: String?) {
        super.init(fontNamed: fontName)
    }
    
    func commonInit() {
        fontSize = Configuration.font.size.regular
        fontColor = Configuration.color.textPrimary
    }
    
    static func multipleLineText(labelInPut: AppLabelNode) -> AppLabelNode {
        let subStrings:[String] = labelInPut.text!.components(separatedBy: "\n")
        var labelOutPut = AppLabelNode()
        var subStringNumber:Int = 0
        for subString in subStrings {
            let labelTemp = AppLabelNode(fontNamed: labelInPut.fontName)
            labelTemp.text = subString
            labelTemp.fontColor = labelInPut.fontColor
            labelTemp.fontSize = labelInPut.fontSize
            labelTemp.position = labelInPut.position
            labelTemp.horizontalAlignmentMode = labelInPut.horizontalAlignmentMode
            labelTemp.verticalAlignmentMode = labelInPut.verticalAlignmentMode
            let y:CGFloat = CGFloat(subStringNumber) * labelInPut.fontSize
            print("y is \(y)")
            if subStringNumber == 0 {
                labelOutPut = labelTemp
                subStringNumber += 1
            } else {
                labelTemp.position = CGPoint(x: 0, y: -y)
                labelOutPut.addChild(labelTemp)
                subStringNumber += 1
            }
        }
        return labelOutPut
    }

}
