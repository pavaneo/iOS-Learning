//
//  IconsView.swift
//  SwiftUI-Learning
//
//  Created by Pavan Kumar J on 06/05/23.
//

import SwiftUI

struct IconsView: View {
    var body: some View {
        Image(systemName: "heart.fill")
            .resizable().aspectRatio(contentMode: .fit)
            .font(.system(size: 200))
            .foregroundColor(.red)
    }
}

struct IconsView_Previews: PreviewProvider {
    static var previews: some View {
        IconsView()
    }
}
