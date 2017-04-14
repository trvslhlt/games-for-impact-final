//
//  AppScene.swift
//  WinkWink_11
//
//  Created by trvslhlt on 4/11/17.
//  Copyright © 2017 travis holt. All rights reserved.
//

import SpriteKit

protocol AppSceneDelegate: class {
    func appSceneDidComplete()
}

class AppScene: SKScene {

    weak var appSceneDelegate: AppSceneDelegate?
    
    override init(size: CGSize) {
        super.init(size: size)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didMove(to view: SKView) {
        super.didMove(to: view)
        backgroundColor = Configuration.color.backgroundPrimary
        scaleMode = .resizeFill
    }
    
    func didComplete() {
        appSceneDelegate?.appSceneDidComplete()
    }

}
