//
//  ImageView.swift
//  SwiftUI-Learning
//
//  Created by Pavan Kumar J on 11/05/23.
//

import SwiftUI

struct ImageView: View {
    var body: some View {
        Image("rab")
            .renderingMode(.template)
            .aspectRatio(contentMode: .fit)
    }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView()
    }
}
