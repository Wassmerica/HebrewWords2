//
//  ViewController.swift
//  HebrewWords
//
//  Created by Michael Wasserman on 2018-05-11.
//  Copyright © 2018 Wasserman. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var wordsButton: UIButton!
    @IBOutlet weak var verbsButton: UIButton!
    @IBOutlet weak var expressionsButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //MARK: - IBAction Methods
    
    @IBAction func wordsAction(_ sender: UIButton) {
    }
    
    @IBAction func verbsAction(_ sender: UIButton) {
    }
    
    @IBAction func expressionsButton(_ sender: UIButton) {
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let backItem = UIBarButtonItem()
        backItem.title = "Back"
        navigationItem.backBarButtonItem = backItem
    }
}

