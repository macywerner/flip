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
                    List {
                        ForEach (sStore.sets) { set in
                            ListCell(set: set)
                        }
                        .onDelete(perform: deleteItems)
                        .onMove(perform: moveItems)
                    }
                    .navigationBarTitle(Text("Your Flashcard Sets"))
                    .navigationBarItems (trailing: EditButton())
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
