//
//  LevelListViewController.swift
//  WinkWink_11
//
//  Created by trvslhlt on 4/9/17.
//  Copyright © 2017 travis holt. All rights reserved.
//

import UIKit

class LevelListViewController: AppViewController {
    
    struct LevelPreview {
        let number: Int
        let title: String
    }
    
    let levelPreviews = [
        LevelPreview(number: 1, title: "Know Your body"),
        LevelPreview(number: 1, title: "The Sex Level")
    ]
    
    @IBOutlet weak var levelListView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Configuration.color.backgroundPrimary
        levelListView.dataSource = self
        levelListView.delegate = self
        levelListView.backgroundColor = .clear
        levelListView.separatorStyle = .none
    }

    @IBAction func exitTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    func getLevel(number: Int) -> Level {
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

extension LevelListViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LevelViewController") as! LevelViewController
        let preview = levelPreviews[indexPath.row]
        vc.level = getLevel(number: preview.number)
        present(vc, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return levelPreviews.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let preview = levelPreviews[indexPath.row]
        cell.textLabel?.text = "\(preview.number): \(preview.title)"
        cell.textLabel?.textColor = Configuration.color.textPrimary
        cell.backgroundColor = .clear
        return cell
    }

    
}
