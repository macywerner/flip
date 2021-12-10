//
//  NewCard.swift
//  flip
//
//  Created by cpsc on 12/7/21.
//

import SwiftUI

struct NewCard: View {
    @State var isComplete = false
    @State var selection: Int? = nil
    @StateObject var cStore: CardStore
    @State private var front: String = ""
    @State private var back: String = ""
    var body: some View {
        NavigationView{
            VStack{
                Form{
                    Section(header: Text("Card Information")){
                        DataInput(title: "Term", userInput: $front)
                        DataInput(title: "Defintion", userInput: $back)
                    }
                }
                NavigationLink(destination: Text("Added! Swipe down :)"), tag: 1, selection: $selection){
                    Button(action: {
                        NewCard()
                        self.selection = 1
                    }){
                        Text("Add Card")
                    }
                }
            }
        }
    }
    func NewCard(){
        let newCard = Card(id: UUID().uuidString, front: front, back: back)
        cStore.cards.append(newCard)
    }
}

struct NewCard_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            NewCard(cStore: CardStore(cards: CardData))
        }
    }
}

struct DataInputCard: View {
    var title: String
    @Binding var userInput: String
    var body: some View{
        VStack(alignment: HorizontalAlignment.leading){
            Text(title)
                .font(.headline)
            TextField("Enter \(title)", text: $userInput)
                .textFieldStyle(RoundedBorderTextFieldStyle())
        }
        .padding()
    }
}

