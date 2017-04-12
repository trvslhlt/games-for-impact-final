//
//  LevelListViewController.swift
//  WinkWink_11
//
//  Created by trvslhlt on 4/9/17.
//  Copyright © 2017 travis holt. All rights reserved.
//

import UIKit

class LevelListViewController: AppViewController {

    let levels = [1, 2, 3, 4, 5]
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
}

extension LevelListViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LevelViewController") as! LevelViewController
        vc.level = levels[indexPath.row]
        present(vc, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return levels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "\(levels[indexPath.row])"
        cell.textLabel?.textColor = Configuration.color.textPrimary
        cell.backgroundColor = .clear
        return cell
    }

    
}
