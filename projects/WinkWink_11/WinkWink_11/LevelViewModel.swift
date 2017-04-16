//
//  LevelViewModel.swift
//  WinkWink_11
//
//  Created by trvslhlt on 4/16/17.
//  Copyright © 2017 travis holt. All rights reserved.
//

import Foundation

class LevelViewModel {

    struct LevelPreview {
        let number: Int
        let title: String
    }
    
    let levelPreviews = [
        LevelPreview(number: 1, title: "Know Your body"),
        LevelPreview(number: 1, title: "The Sex Level")
    ]
    
    func level(number: Int) -> Level {
        switch number {
        case 1:
            let challenges = [TapTheVaginaNode(), SelectVulvasChallengeNode()]
            return Level(number: 1, timeLimit: 20, title: "Know your body", challenges: challenges)
        case 2:
            let challenges = [TapTheVaginaNode(), TapTheVaginaNode()]
            return Level(number: 2, timeLimit: 20, title: "The Sex Level", challenges: challenges)
        default:
            fatalError("level not found")
        }
    }

}
