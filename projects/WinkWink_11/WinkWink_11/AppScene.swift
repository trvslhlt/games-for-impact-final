//
//  AppScene.swift
//  WinkWink_11
//
//  Created by trvslhlt on 4/11/17.
//  Copyright © 2017 travis holt. All rights reserved.
//

import SpriteKit

class AppScene: SKScene {

    override func didMove(to view: SKView) {
        super.didMove(to: view)
        backgroundColor = Configuration.color.backgroundPrimary
        self.scaleMode = .resizeFill
    }

}
