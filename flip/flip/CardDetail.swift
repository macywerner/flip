//
//  CardDetail.swift
//  flip
//
//  Created by cpsc on 12/7/21.
//

import SwiftUI
import UIKit

struct CardDetail: View {
    let card: Card
    @State private var selection = 1
    @State var tapped = false
    @StateObject private var cStore : CardStore = CardStore(cards: CardData)
    @State var isModal: Bool = false
    var tap: some Gesture {
        //add tap gesture (click twice)
        TapGesture(count: 2)
            .onEnded { _ in
                self.tapped = !self.tapped
            }
    }
    var body: some View {
        ZStack {
            VStack {
                //if text was clicked twice, switch the screen to show the "back" of the flashcard
                if (tapped){
                    Back(selectedCard: card)
                        .frame(width: 400.0, height: 1000)
                        .gesture(tap)
                //if the text was clicked twice again, switch the screen to show the "front" of the flashcard
                } else {
                    Front(selectedCard: card)
                        .frame(width: 300.0, height: 300.0)
                        .gesture(tap)
                }
                //button to add another card at the bottom of the page that shows the front of the flashcard
                    //note: button works, but we couldn't make it add the card to the card list on the previous page
                Button("+"){
                    self.isModal = true
                //page will pop up when a flashcard is added
                //swipe down on the page to go back to the list of flashcards, which should include the new added flashcard in theory, but we couldn't make it work
                }.sheet(isPresented: $isModal, content: {
                        NewCard(cStore: self.cStore)
                })
            }
        }
    }
}

struct CardDetail_Previews: PreviewProvider {
    static var previews: some View {
        CardDetail(card: CardData[0])
    }
}
