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
    
    static func saveMarkedWords(words: [Word]) {
        if let encodedData = try? JSONEncoder().encode(words) {
            let thePath = FileManager.getDocumentsDirectory().appendingPathComponent("marked.json")
            do {
                try encodedData.write(to: thePath)
            }
            catch {
                print("Failed to write JSON data: \(error.localizedDescription)")
            }
        }
    }
    
    static func getMarkedWords() -> [Word]? {
        let thePath = FileManager.getDocumentsDirectory().appendingPathComponent("marked.json")
        do {
            let data = try Data(contentsOf: thePath)
            let decoder = JSONDecoder()
            let markedWords = try decoder.decode([Word].self, from: data)
            print(markedWords)
            return markedWords
        } catch {
            print("Error reading Marked words: \(error)")
            
        }
        
        return nil
    }
    
    
}

//MARK: - FileManager
extension FileManager {
    
    /**
     Gets the Documents Directory
     
     - Version: 0.1
     
     - Returns: URL
     
     */
    static func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentDirectory = paths[0]
        return documentDirectory
    }
}
