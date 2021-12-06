//
//  NewSet.swift
//  flip
//
//  Created by cpsc on 12/2/21.
//

import SwiftUI

struct NewSet: View {
    @StateObject var sStore: SetStore
    @State private var name: String = ""
    @State private var description: String = ""
    var body: some View {
        Form{
            Section(header: Text("Flashcard Info")){
                DataInput(title: "Flashcard set name", userInput: $name)
                DataInput(title: "Description/Subject", userInput: $description)
            }
            Button(action: NewSet){
                Text("Add Set")
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
        NewSet(sStore: SetStore(sets: FlashData))
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
