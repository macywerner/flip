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
        TapGesture(count: 2)
            .onEnded { _ in
                self.tapped = !self.tapped
            }
    }
    var body: some View {
        ZStack {
            VStack {
                if (tapped){
                    Back(selectedCard: card)
                        .frame(width: 400.0, height: 1000)
                        .gesture(tap)
                } else {
                    Front(selectedCard: card)
                        .frame(width: 300.0, height: 300.0)
                        .gesture(tap)
                }
            }
        }
    }
}

struct CardDetail_Previews: PreviewProvider {
    static var previews: some View {
        CardDetail(card: CardData[0])
    }
}
