//
//  MarkedWordsViewController.swift
//  HebrewWords
//
//  Created by Michael Wasserman on 2018-05-17.
//  Copyright © 2018 Wasserman. All rights reserved.
//

import UIKit

class MarkedWordsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var markedWords: [Word]?
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "WordSetTableViewCell", bundle: nil), forCellReuseIdentifier: "WordSetTableViewCell")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        markedWords = WordRepository.getMarkedWords()
        if let _ = markedWords {
            print("we got words")
        } else {
            let alert = UIAlertController(title: "No Marked Words", message: "No Marked Words", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: { [weak self] action in
                _ = self?.navigationController?.popViewController(animated: true)
            }))
            
            self.present(alert, animated: true)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - UITableViewDataSource Methods
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let theWords = markedWords {
            return theWords.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "WordSetTableViewCell", for: indexPath) as? WordSetTableViewCell {
            cell.theWord.text = markedWords?[indexPath.row].hebrew
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
