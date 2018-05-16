//
//  Word.swift
//  HebrewWords
//
//  Created by Michael Wasserman on 2018-05-16.
//  Copyright © 2018 Wasserman. All rights reserved.
//

import Foundation

struct Word: Codable {
    let english: String
    let hebrew: String
    let group: Int
}
