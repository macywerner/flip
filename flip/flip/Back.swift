//
//  Back.swift
//  flip
//
//  Created by Helena Gray on 12/7/21.
//

import SwiftUI

struct Back: View {
    @SceneStorage("mytext") private var editorText = ""
    let selectedCard: Card
    var body: some View {
        //page to show the back of the flashcard
        Text(selectedCard.back)
            .padding(30)
            .font(.callout)
    }
}

struct Back_Previews: PreviewProvider {
    static var previews: some View {
        Back(selectedCard: CardData[0])
    }
}
