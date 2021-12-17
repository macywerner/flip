//
//  NewSet.swift
//  flip
//
//  Created by cpsc on 12/2/21.
//

import SwiftUI

struct NewSet: View {
    @State var isComplete = false
    @State var selection: Int? = nil
    @StateObject var sStore: SetStore
    @State private var name: String = ""
    @State private var description: String = ""
    var body: some View {
        NavigationView{
            VStack{
                //so the user can type information into the selected spots
                Form{
                    Section(header: Text("Flashcard Info")){
                        //spot for the user to input the desired set name for the new flashcard
                        DataInput(title: "Flashcard set name", userInput: $name)
                        //spot for the user to input the desired description for the above term for the new flashcard
                        DataInput(title: "Description/Subject", userInput: $description)
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
                        NewSet()
                        self.selection = 1
                    }){
                        Text("Add Set")
                    }
                }
            }
        }
    }
    //function for NewSet above
    func NewSet(){
        let newSet = Set(id: UUID().uuidString, name: name, description: description)
        //adds the new set to the list of sets
        sStore.sets.append(newSet)
    }
}

struct NewSet_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            NewSet(sStore: SetStore(sets: FlashData))
        }
    }
}

//to input the title and description above
struct DataInput: View {
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
