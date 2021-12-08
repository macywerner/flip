//
//  CardDetail.swift
//  flip
//
//  Created by cpsc on 12/7/21.
//

import SwiftUI

struct CardDetail: View {
    let card: Card
    @State private var selection = 1
    var body: some View {
        TabView {
            Front()
                .tabItem {
                    Text("FRONT")
                }
            Back()
                .tabItem {
                    Text("BACK")
                }
        }
    }
}

struct CardDetail_Previews: PreviewProvider {
    static var previews: some View {
        CardDetail(card: CardData[0])
    }
}
