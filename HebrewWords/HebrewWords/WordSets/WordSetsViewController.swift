//
//  WordSetsViewController.swift
//  HebrewWords
//
//  Created by Michael Wasserman on 2018-05-16.
//  Copyright © 2018 Wasserman. All rights reserved.
//

import UIKit

class WordSetsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var words: [Word]? = nil
    var wordsSorted: Dictionary<Int, [Word]> = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        words = WordRepository.getAllWords()
        if let theWords = words {
            wordsSorted = Dictionary(grouping: theWords, by: { item in item.group })
        }
        print(wordsSorted)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - UITableViewDelegate Methods
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Please select a word set"
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return wordsSorted.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WordSet", for: indexPath)
        cell.textLabel?.text = "Word Set \(indexPath.row)"
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "ShowWordSetSegue" {
            let newVC = segue.destination as? WordsPageViewController
            if let rowSelected = tableView.indexPathForSelectedRow?.row {
                newVC?.wordsSet = wordsSorted[rowSelected]
            }
            
        }
    }
    

}
