//
//  WordRepository.swift
//  HebrewWords
//
//  Created by Michael Wasserman on 2018-05-16.
//  Copyright © 2018 Wasserman. All rights reserved.
//

import Foundation

class WordRepository {
    
    static func getAllWords() -> [Word]? {
        if let url = Bundle.main.url(forResource: "words", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode([Word].self, from: data)
                print(jsonData)
                return jsonData
            } catch {
                print("ERROR getting words: \(error)")
            }
        }
        return nil
    }
}
