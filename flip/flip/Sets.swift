//
//  Sets.swift
//  flip
//
//  Created by cpsc on 12/2/21.
//

import SwiftUI
import UIKit

//list of sets page
struct Sets: View {
    @StateObject private var sStore : SetStore = SetStore(sets: FlashData)
    @State var isModal: Bool = false
    @State private var isActive = false
    var body: some View {
        VStack{
            NavigationView {
                VStack{
                    // the actual list of the sets
                    List {
                        ForEach (sStore.sets) { set in
                            ListCell(set: set)
                        }
                        .onDelete(perform: deleteItems)
                        .onMove(perform: moveItems)
                    }
                    //title for page
                    .navigationBarTitle(Text("Your Flashcard Sets"))
                    // edit in navigation bar
                    .navigationBarItems (trailing: EditButton())
                    // button to add a set and bring you to the correct view through a sheet
                    Button("Add Set") {
                        self.isModal = true
                        isActive = true
                    }.sheet(isPresented: $isModal, content: {
                        NewSet(sStore: self.sStore)
                            })
                }
            }
        }
    }
    // functions of the edit button
    func deleteItems(at offsets: IndexSet){
        sStore.sets.remove(atOffsets: offsets)
    }
    func moveItems(from source: IndexSet, to destination: Int) {
        sStore.sets.move(fromOffsets: source, toOffset: destination)
    }
}

struct Sets_Previews: PreviewProvider {
    static var previews: some View {
        Sets()
    }
}

// for each set in the list, navigation to correct cards
struct ListCell: View {
    var set: Set
    var body: some View {
        NavigationLink(destination: SetDetail(selectedSet: set)) {
            HStack{
                Text(set.name)
            }
        }
    }
}
