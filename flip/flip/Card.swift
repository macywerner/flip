//
//  Card.swift
//  flip
//
//  Created by cpsc on 12/7/21.
//

import Foundation
import SwiftUI

struct Card : Codable, Identifiable {
    var id : String
    var front : String
    var back : String
}
