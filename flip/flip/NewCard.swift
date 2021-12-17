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
                //so the user can type information into the selected spots
                Form{
                    Section(header: Text("Card Information")){
                        //spot for the user to input the desired term for the new flashcard
                        DataInput(title: "Term", userInput: $front)
                        //spot for the user to input the desired definition for the above term for the new flashcard
                        DataInput(title: "Defintion", userInput: $back)
                    }
                }
                //designs what the page that will appear when a new flashcard is added should look like
                NavigationLink(destination: Text("Added! Swipe down :) \n \n \n                    ▼ \n                    ▼ \n                    ▼")
                        .font(.title)
                        .fontWeight(.medium)
                    //hide the navigation back bar button
                    .navigationBarBackButtonHidden(true), tag: 1, selection: $selection){
                    //button to add the flashcard to the list of flashcards in the set after the above information is inputted
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
    //function for NewCard above
    func NewCard(){
        let newCard = Card(id: UUID().uuidString, front: front, back: back)
        //adds the new card to the list of cards
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

//to input the term and definition above
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

