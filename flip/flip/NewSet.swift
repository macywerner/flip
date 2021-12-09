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
                Form{
                    Section(header: Text("Flashcard Info")){
                        DataInput(title: "Flashcard set name", userInput: $name)
                        DataInput(title: "Description/Subject", userInput: $description)
                    }
        
                }
                NavigationLink(destination: Text("Added! Swipe down :)"), tag: 1, selection: $selection){
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
    func NewSet(){
        let newSet = Set(id: UUID().uuidString, name: name, description: description)
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
