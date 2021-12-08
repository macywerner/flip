//
//  CardDetail.swift
//  flip
//
//  Created by cpsc on 12/7/21.
//

import SwiftUI

struct CardDetail: View {
    let selectedCard: Card
    @State private var selection = 1
    var body: some View {
        Form {
            //this is where the flashcard goes
            //buttons for front, back, home, +
        }
    }
}

struct CardDetail_Previews: PreviewProvider {
    static var previews: some View {
        CardDetail(selectedCard: CardData[0])
    }
}
