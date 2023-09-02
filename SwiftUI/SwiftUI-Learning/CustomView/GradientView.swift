//
//  GradientView.swift
//  SwiftUI-Learning
//
//  Created by Pavan Kumar J on 06/05/23.
//

import SwiftUI

struct GradientView: View {
    var body: some View {
        VStack {
            
            RoundedRectangle(cornerRadius: 25.0)
                .fill(
                    LinearGradient(
                        gradient:
                            Gradient(colors: [.orange, .white, .green]),
                        startPoint: .topLeading,
                        endPoint: .bottom)
                )
                .frame(width: 350, height: 200)
            
            Spacer()
            
            RadialGradient(gradient:
                            Gradient(colors: [.yellow, .red]),
                           center: .leading,
                           startRadius: 5,
                           endRadius: 400)
            .cornerRadius(25.0)
            .frame(width: 350, height: 200)
            
            Spacer()
            
            AngularGradient(gradient:
                                Gradient(colors: [.red, .blue]),
                            center: .center,
                            angle: .degrees(180 + 45))
            .cornerRadius(25.0)
            .frame(width: 350, height: 200)

        }
    }
}

struct GradientView_Previews: PreviewProvider {
    static var previews: some View {
        GradientView()
    }
}
