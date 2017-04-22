//
//  LevelViewModel.swift
//  WinkWink_11
//
//  Created by trvslhlt on 4/16/17.
//  Copyright © 2017 travis holt. All rights reserved.
//

import UIKit

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
            let clitorisChallenge = TapTheVulvaPartChallengeNode(
                    challengeInstructions: "Tap on the clitoris.",
                    correctTapRects: [CGRect(x: 0,y: 50, width: 50, height: 50)])
            let vaginaChallenge = TapTheVulvaPartChallengeNode(
                    challengeInstructions: "Tap on the vagina.",
                    correctTapRects: [CGRect(x: 0,y: -90, width: 50, height: 50)])
            let urethraChallenge = TapTheVulvaPartChallengeNode(
                    challengeInstructions: "Tap on the urethra.",
                    correctTapRects: [CGRect(x: 0,y: 0, width: 50, height: 50)])
            let labiaChallenge = TapTheVulvaPartChallengeNode(
                    challengeInstructions: "Tap on the labia.",
                    correctTapRects: [
                        CGRect(x: -70,y: 0, width: 70, height: 400),
                        CGRect(x: 70,y: 0, width: 70, height: 400)])
            let normalVulvaChallenge = SelectVulvasChallengeNode()
            let challenges = [
                    clitorisChallenge,
                    vaginaChallenge,
                    urethraChallenge,
                    labiaChallenge,
                    normalVulvaChallenge]
            return Level(number: 1, timeLimit: 20, title: "Know your body", challenges: challenges)
        case 2:
            let challenges = [SelectVulvasChallengeNode()]
            return Level(number: 2, timeLimit: 20, title: "The Sex Level", challenges: challenges)
        default:
            fatalError("level not found")
        }
    }

}
