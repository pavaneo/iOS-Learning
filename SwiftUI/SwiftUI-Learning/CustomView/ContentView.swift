//
//  ContentView.swift
//  SwiftUI-Learning
//
//  Created by Pavan Kumar J on 05/05/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Welcome to SwiftUI Tutorials Info.plist contained no UIScene configuration dictionary (looking for configuration named)")
                .font(.system(size: 18, weight: .semibold, design: .serif))
                .fontWeight(.regular)
                .baselineOffset(0.5)
                .multilineTextAlignment(.center)
        }.padding(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
