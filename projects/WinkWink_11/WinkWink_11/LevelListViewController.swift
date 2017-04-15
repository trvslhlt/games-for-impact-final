//
//  LevelListViewController.swift
//  WinkWink_11
//
//  Created by trvslhlt on 4/9/17.
//  Copyright © 2017 travis holt. All rights reserved.
//

import UIKit

class LevelListViewController: AppViewController {

    let levelNumbers = [1, 2]
    @IBOutlet weak var levelListView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Configuration.color.backgroundPrimary
        levelListView.dataSource = self
        levelListView.delegate = self
        levelListView.backgroundColor = .clear
        levelListView.separatorStyle = .none
    }
    
    func getLevel(number: Int) -> Level {
        switch number {
        case 1:
            let challenges = [TapTheVaginaNode(), TapTheVaginaNode()]
            return Level(number: 1, timeLimit: 20, title: "Welcome!", challenges: challenges)
        default:
            let challenges = [TapTheVaginaNode(), TapTheVaginaNode()]
            return Level(number: 2, timeLimit: 30, title: "Some Other Stuff!", challenges: challenges)
        }
    }

    @IBAction func exitTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}

extension LevelListViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LevelViewController") as! LevelViewController
        let level = getLevel(number: indexPath.row)
        vc.level = level
        present(vc, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return levelNumbers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let level = getLevel(number: indexPath.row + 1)
        cell.textLabel?.text = "\(level.number): \(level.title)"
        cell.textLabel?.textColor = Configuration.color.textPrimary
        cell.backgroundColor = .clear
        return cell
    }

    
}
