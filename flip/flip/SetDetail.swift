//
//  SetDetail.swift
//  flip
//
//  Created by Helena Gray on 12/6/21.
//

import SwiftUI

struct SetDetail: View {
    let selectedSet: Set
    @State private var selection = 1
    var body: some View {
        Form {
            //this is where the flashcard goes
            //buttons for front, back, home, +
        }
    }

}

struct SetDetail_Previews: PreviewProvider {
    static var previews: some View {
        SetDetail(selectedSet: FlashData[0])
    }
}
