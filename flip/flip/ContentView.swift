//
//  ContentView.swift
//  flip
//
//  Created by cpsc on 11/30/21.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var sStore : SetStore = SetStore(sets: FlashData)
    var body: some View {
        //use navigation view to create the title
        NavigationView {
            VStack {
                Text("Flip")
                    .font(.largeTitle)
                    .fontWeight(.medium)
                    .foregroundColor(Color.black)
                    .padding(5)
                //navigation link to list of sets
                NavigationLink(destination:
                                Sets().navigationBarHidden(true)) {
                    //name link
                    Text("View Flashcard Sets")
                        .frame(minWidth: 0, maxWidth: 300)
                        .padding()
                        .foregroundColor(.white)
                            .background(LinearGradient(gradient: Gradient(colors: [Color.gray, Color.blue]), startPoint: .leading, endPoint: .trailing))
                        .cornerRadius(18)
                        .font(.title2)
                }
                
            }
            
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
