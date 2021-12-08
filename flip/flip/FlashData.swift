//
//  FlashData.swift
//  flip
//
//  Created by Helena Gray on 12/6/21.
//

import Foundation
import UIKit
import SwiftUI

var FlashData: [Set] = loadJsonSet("FlashcardData.json")

func loadJsonSet<T: Decodable>(_ filename: String) -> T {
    var data = Data()
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("\(filename) not found.")
    }
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Could not load \(filename): \(error)")
    }
    do {
        return try JSONDecoder().decode(T.self, from: data)
    } catch {
        fatalError("Unable to parse \(filename): \(error)")
    }
}

var CardData: [Card] = loadJsonCard("CardData.json")

func loadJsonCard<T: Decodable>(_ filename: String) -> T {
    var data = Data()
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("\(filename) not found.")
    }
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Could not load \(filename): \(error)")
    }
    do {
        return try JSONDecoder().decode(T.self, from: data)
    } catch {
        fatalError("Unable to parse \(filename): \(error)")
    }
}

