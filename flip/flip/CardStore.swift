//
//  CardStore.swift
//  flip
//
//  Created by cpsc on 12/7/21.
//

import Foundation
import SwiftUI
import Combine

class CardStore : ObservableObject {
    
    @Published var cards : [Card]
    
    init (cards: [Card] = []){
        self.cards = cards
    }
}
