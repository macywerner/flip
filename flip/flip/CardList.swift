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
                .navigationBarTitle(Text("Cards"))
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
        CardList()
    }
}

struct ListCellCard: View {
    var card: Card
    var body: some View {
        NavigationLink(destination: CardDetail(selectedCard: card)) {
            HStack{
                Text(card.front)
            }
        }
    }
}
