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

    var body: some View {
        VStack{
            NavigationView {
                List {
                    ForEach (cStore.cards) { card in
                        ListCellCard(card: card)
                    }
                    .onDelete(perform: deleteItems)
                    .onMove(perform: moveItems)
                }
                .navigationBarTitle(Text(selectedSet.name))
                .navigationBarItems(leading: NavigationLink(destination: NewCard(cStore: self.cStore)){
                        Text("Add")
                }, trailing: EditButton())
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
