//
//  WordSet1ViewController.swift
//  HebrewWords
//
//  Created by Michael Wasserman on 2018-05-16.
//  Copyright © 2018 Wasserman. All rights reserved.
//

import UIKit

class WordSet1ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    var wordSet: [Word]?
    var wordState = [0, 0, 0, 0, 0, 0]
    
    //MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "WordSetTableViewCell", bundle: nil), forCellReuseIdentifier: "WordSetTableViewCell")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: UITableViewDataSource Methods
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "WordSetTableViewCell", for: indexPath) as? WordSetTableViewCell {
            if wordState[indexPath.row] == 0 {
                cell.theWord.text = wordSet?[indexPath.row].hebrew
            } else {
                cell.theWord.text = wordSet?[indexPath.row].english
            }
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as? WordSetTableViewCell
        if wordSet?[indexPath.row].hebrew == cell?.theWord.text {
            //flip to english
            wordState[indexPath.row] = 1
        } else {
            //flip to hebrew
            wordState[indexPath.row] = 0
        }
        tableView.reloadRows(at: [indexPath], with: .none)
    }
    
    //MARK: - Helper Methods
    
    func flipAll() {
        var counts: [String: Int] = [:]
        for item in wordState {
            counts[String(item)] = (counts[String(item)] ?? 0) + 1
        }
        
        if counts.count == 1 {
            //all words are in one state - if 0 all are Hebrew - if 1 all are English
            if counts["0"] != nil {
                //flip to english
                wordState = wordState.map { _ in 1 }
            } else {
                //flip to hebrew
                wordState = wordState.map { _ in 0 }
            }

        } else {
            if let hebCount = counts["0"], let engCount = counts["1"] {
                if hebCount >= engCount {
                    //make all english
                    wordState = wordState.map { _ in 0 }
                } else {
                    wordState = wordState.map { _ in 1 }
                }
            }
        }
        
        tableView.reloadData()
    }
}
