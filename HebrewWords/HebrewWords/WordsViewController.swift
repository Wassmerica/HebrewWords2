//
//  WordsViewController.swift
//  HebrewWords
//
//  Created by Michael Wasserman on 2018-05-11.
//  Copyright © 2018 Wasserman. All rights reserved.
//

import UIKit

class WordsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Words"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "WordSetsSegue" {
            print("here")
        }
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    

}
