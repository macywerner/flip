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
                    Text(selectedSet.name)
                        .font(.title)
                    Text(selectedSet.description)
                        .font(.subheadline)
                        .frame(width: 370, height: 30, alignment: .topLeading)
                    EditButton()
                        .padding(.leading, 350.0)
                    List {
                        ForEach (cStore.cards) { card in
                            ListCellCard(card: card)
                            
                        }
                        .onDelete(perform: deleteItems)
                        .onMove(perform: moveItems)
                    }
                    Button("Add Card"){
                        self.isModal = true
                    }.sheet(isPresented: $isModal, content: {
                            NewCard(cStore: self.cStore)
                    })
                }
            }
        }
    }
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
