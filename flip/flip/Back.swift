//
//  Back.swift
//  flip
//
//  Created by Helena Gray on 12/7/21.
//

import SwiftUI

struct Back: View {
    @SceneStorage("mytext") private var editorText = ""
    var body: some View {
        TextEditor(text: $editorText)
            .padding(30)
            .font(.largeTitle)
    }
}

struct Back_Previews: PreviewProvider {
    static var previews: some View {
        Back()
    }
}
