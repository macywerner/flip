//
//  CardList.swift
//  flip
//
//  Created by cpsc on 12/7/21.
//

import SwiftUI
import UIKit

struct CardList: View {
    @StateObject private var cStore : CardStore = CardStore(cards: CardData)
    let selectedSet: Set
    @State var isModal: Bool = false
    var body: some View {
        VStack {
            ZStack {
                VStack {
                    //show the title of the set
                    Text(selectedSet.name)
                        .font(.title)
                    //show the description of the set
                    Text(selectedSet.description)
                        .font(.subheadline)
                        .frame(width: 370, height: 70)
                    //edit button to use onDelete and onMove methods below
                    EditButton()
                        .padding(.leading, 350.0)
                    //lists the flashcards in the specific set
                    List {
                        ForEach (cStore.cards) { card in
                            ListCellCard(card: card)
                            
                        }
                        //to delete a flashcard in the list and reorder the flashcards in the list
                        .onDelete(perform: deleteItems)
                        .onMove(perform: moveItems)
                    }
                    //button to add a flashcard to the list of flashcards in the set
                    Button("Add Card"){
                        self.isModal = true
                    //page will pop up when a flashcard is added
                    //swipe down on the page to go back to the list of flashcards in the set, which should include the new added flashcard
                    }.sheet(isPresented: $isModal, content: {
                            NewCard(cStore: self.cStore)
                    })
                }
            }
        }
    }
    //function for onDelete above
    func deleteItems(at offsets: IndexSet){
        //removes the flashcard from the list of flashcards
        cStore.cards.remove(atOffsets: offsets)
    }
    //function for onMove above
    func moveItems(from source: IndexSet, to destination: Int) {
        //moves items around
        cStore.cards.move(fromOffsets: source, toOffset: destination)
    }
}

struct CardList_Previews: PreviewProvider {
    static var previews: some View {
        CardList(selectedSet: FlashData[0])
    }
}

//for list function above
struct ListCellCard: View {
    var card: Card
    var body: some View {
        //use navigation link so that when a flashcard is clicked on, the front of the flashcard opens
        NavigationLink(destination: CardDetail(card: card)) {
            HStack{
                Text(card.front)
            }
        }
    }
}
