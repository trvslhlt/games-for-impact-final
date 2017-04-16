//
//  AppSpriteNode.swift
//  WinkWink_11
//
//  Created by trvslhlt on 4/10/17.
//  Copyright © 2017 travis holt. All rights reserved.
//

import SpriteKit

class AppSpriteNode: SKSpriteNode {
    
    var audioNode: SKAudioNode?
    
    var didTap: (() -> ())? {
        didSet {
            isUserInteractionEnabled = didTap != nil
        }
    }
    
    init(imageNamed name: String) {
        let texture = SKTexture(imageNamed: name)
        super.init(texture: texture, color: UIColor.clear, size: texture.size())
        commonInit()
    }
    
    init(color: UIColor, size: CGSize) {
        super.init(texture: nil, color: color, size: size)
        commonInit()
    }
    
    init() {
        super.init(texture: nil, color: .clear, size: CGSize.zero)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func commonInit() {
        audioNode = SoundManager.getSoundNode(filename: Sound.Filename.beep)
        if let audioNode = audioNode {
            audioNode.autoplayLooped = false
            addChild(audioNode)
        }
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        didTap?()
        audioNode?.run(SKAction.play())
    }
    
    func scaleToFit(containerSize: CGSize) {
        var widthScaleChange = containerSize.width / size.width
        var heightScaleChange = containerSize.height / size.height
        
        if widthScaleChange < 1 && heightScaleChange < 1 {
            if widthScaleChange > heightScaleChange {
                heightScaleChange = widthScaleChange
            } else {
                widthScaleChange = heightScaleChange
            }
        } else if widthScaleChange < 1 {
            heightScaleChange = widthScaleChange
        } else if heightScaleChange < 1 {
            widthScaleChange = heightScaleChange
        } else {
            if widthScaleChange < heightScaleChange {
                widthScaleChange = heightScaleChange
            } else {
                heightScaleChange = widthScaleChange
            }
        }
        setScale(widthScaleChange)
    }

}
