//
//  Front.swift
//  flip
//
//  Created by Helena Gray on 12/7/21.
//

import SwiftUI

struct Front: View {
    @AppStorage("mytext") var editorText: String = "Sample Text"
    let selectedCard: Card
    var body: some View {
        Text(selectedCard.front)
            .padding(30)
            .font(.largeTitle)
    }
}

struct Front_Previews: PreviewProvider {
    static var previews: some View {
        Front(selectedCard: CardData[0])
        
    }
}
