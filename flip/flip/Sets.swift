//
//  Sets.swift
//  flip
//
//  Created by cpsc on 12/2/21.
//

import SwiftUI
import UIKit

struct Sets: View {
    @StateObject private var sStore : SetStore = SetStore(sets: FlashData)
    @State var isModal: Bool = false
    @State private var isActive = false
    var body: some View {
        VStack{
            NavigationView {
                VStack{
                    //list all the sets in the json file
                    List {
                        ForEach (sStore.sets) { set in
                            ListCell(set: set)
                        }
                        //to delete things from the list and change the ordering of the list
                        .onDelete(perform: deleteItems)
                        .onMove(perform: moveItems)
                    }
                    //title the list
                    .navigationBarTitle(Text("Your Flashcard Sets"))
                    //add edit button to use onDelete and onMove above
                    .navigationBarItems (trailing: EditButton())
                    //button at the bottom of the screen to add a set
                    Button("Add Set") {
                        self.isModal = true
                        isActive = true
                    //page will pop up when a set is added
                    //swipe down on the page to go back to the list of sets, which should include the new added set
                    }.sheet(isPresented: $isModal, content: {
                        NewSet(sStore: self.sStore)
                            })
                }
            }
        }
    }
    //function for onDelete method above
    func deleteItems(at offsets: IndexSet){
        //removes item from list
        sStore.sets.remove(atOffsets: offsets)
    }
    //function for onMove method above
    func moveItems(from source: IndexSet, to destination: Int) {
        //moves items around
        sStore.sets.move(fromOffsets: source, toOffset: destination)
    }
}

struct Sets_Previews: PreviewProvider {
    static var previews: some View {
        Sets()
    }
}

//for list function above
struct ListCell: View {
    var set: Set
    var body: some View {
        //use navigation link so that when a set is clicked on, the list of cards in that set opens
        NavigationLink(destination: SetDetail(selectedSet: set)) {
            HStack{
                Text(set.name)
            }
        }
    }
}
