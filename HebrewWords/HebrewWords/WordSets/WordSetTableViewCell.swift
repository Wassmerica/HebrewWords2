//
//  WordSetTableViewCell.swift
//  HebrewWords
//
//  Created by Michael Wasserman on 2018-05-16.
//  Copyright © 2018 Wasserman. All rights reserved.
//

import UIKit

class WordSetTableViewCell: UITableViewCell {

    @IBOutlet weak var theWord: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
