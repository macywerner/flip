//
//  SetStore.swift
//  flip
//
//  Created by Helena Gray on 12/6/21.
//

import Foundation
import SwiftUI
import Combine

class SetStore : ObservableObject {
    
    @Published var sets : [Set]
    
    init (sets: [Set] = []){
        self.sets = sets
    }
}
