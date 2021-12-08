//
//  SetDetail.swift
//  flip
//
//  Created by Helena Gray on 12/6/21.
//

import SwiftUI

struct SetDetail: View {
    let selectedSet: Set
    @State private var selection = 1
    var body: some View {
        Form {
            TabView(selection: $selection) {
                CardsList()
                    .tabItem {
                        Text("Cards")
                        
                    }.tag(1)
            }
        }
    }

}

struct CardsList: View {
    @StateObject private var cStore : CardStore = CardStore(cards: CardData)
    var body: some View {
        VStack{
            NavigationView {
                List {
                    ForEach (cStore.cards) { card in
                        ListCellCards(card: card)
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

struct SetDetail_Previews: PreviewProvider {
    static var previews: some View {
        SetDetail(selectedSet: FlashData[0])
    }
}

struct ListCellCards: View {
    var card: Card
    var body: some View {
        NavigationLink(destination: SetDetail(selectedSet: FlashData[0])) {
            HStack{
                Text(card.front)
            }
        }
    }
}
