//
//  Added.swift
//  flip
//
//  Created by cpsc on 12/9/21.
//

import SwiftUI
import UIKit

struct Added: View {
    var body: some View {
        VStack{
            Text("▼")
            Text("▼")
            Text("▼")
                .padding(.bottom, 100.0)
            Text("Added! Swipe down.")
                .font(.title2)
                .fontWeight(.medium)
        }
    }
}

struct Added_Previews: PreviewProvider {
    static var previews: some View {
        Added()
    }
}
