//
//  CardList.swift
//  flip
//
//  Created by cpsc on 12/7/21.
//

import SwiftUI
import UIKit

//for each set, the list of cards contained
struct CardList: View {
    @StateObject private var cStore : CardStore = CardStore(cards: CardData)
    let selectedSet: Set
    @State var isModal: Bool = false
    var body: some View {
        VStack {
            ZStack {
                VStack {
                    //selected set title
                    Text(selectedSet.name)
                        .font(.title)
                    //selected set description
                    Text(selectedSet.description)
                        .font(.subheadline)
                        .frame(width: 370, height: 70)
                    //edit button
                    EditButton()
                        .padding(.leading, 350.0)
                    // list of cards in set
                    List {
                        ForEach (cStore.cards) { card in
                            ListCellCard(card: card)
                            
                        }
                        // functions of the edit button called
                        .onDelete(perform: deleteItems)
                        .onMove(perform: moveItems)
                    }
                    // add card button through the use if a sheet
                    Button("Add Card"){
                        self.isModal = true
                    }.sheet(isPresented: $isModal, content: {
                            NewCard(cStore: self.cStore)
                    })
                }
            }
        }
    }
    // functions of the edit button
    func deleteItems(at offsets: IndexSet){
        cStore.cards.remove(atOffsets: offsets)
    }
    func moveItems(from source: IndexSet, to destination: Int) {
        cStore.cards.move(fromOffsets: source, toOffset: destination)
    }
}

struct CardList_Previews: PreviewProvider {
    static var previews: some View {
        CardList(selectedSet: FlashData[0])
    }
}

// navigation link to actual card for each card a set
struct ListCellCard: View {
    var card: Card
    var body: some View {
        NavigationLink(destination: CardDetail(card: card)) {
            HStack{
                Text(card.front)
            }
        }
    }
}
