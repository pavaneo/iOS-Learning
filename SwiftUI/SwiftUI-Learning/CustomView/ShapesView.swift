//
//  ShapesView.swift
//  SwiftUI-Learning
//
//  Created by Pavan Kumar J on 05/05/23.
//

import SwiftUI

struct ShapesView: View {
    var body: some View {
        VStack {
            Circle()
//                .fill(.red)
//                .trim(from: 0.2, to: 1.0)
                .stroke(.red,
                        style:
                            StrokeStyle(lineWidth: 20, lineCap: .butt,
                                        dash: [10]))
        }
        .padding(.all)
    }
}

struct ShapesView_Previews: PreviewProvider {
    static var previews: some View {
        ShapesView()
    }
}
