//
//  StackViews.swift
//  SwiftUI-Learning
//
//  Created by Pavan Kumar J on 12/05/23.
//

import SwiftUI

struct StackViews: View {
    let radius = 12
    let color: [Color] = [.red, .blue, .orange, .gray, .green, .purple, .yellow, .pink, .brown, .cyan, .indigo, .primary, .secondary, .teal, .black, .mint]
    var body: some View {
        VStack {
//            Rectangle()
//                .fill(Color(red: 255/255,
//                            green: 103/255, blue: 31/255))
//                .frame(width: 350, height: 80)
//                .cornerRadius(radius: 12.0, corners: [.topLeft, .topRight])
//
//            ZStack {
//                Rectangle()
//                    .fill(Color(red: 255/255,
//                                green: 255/255, blue: 255/255))
//                    .frame(width: 350, height: 80)
//
//                Circle()
//                    .strokeBorder(Color(red: 6/255,
//                                        green: 3/255, blue: 141/255),lineWidth: 1.5)
//                    .frame(width: 80, height: 80)
//
//            }
//            Rectangle()
//                .fill(Color(red: 4/255,
//                            green: 106/255, blue: 56/255))
//                .frame(width: 350, height: 80)
//                .cornerRadius(radius: 12.0, corners: [.bottomLeft, .bottomRight])
            ScrollView {
                VStack {
                    ForEach(0..<100) { index in
                        ScrollView(.horizontal, showsIndicators: false, content: {
                            HStack {
                                ForEach(0..<100) { value in
                                    RoundedRectangle(cornerRadius: 10.0)
                                        .fill(color.randomElement() ?? .white)
                                        .frame(width: 70, height: 70)
                                        .shadow(radius: 10)
                                        .padding()
                                }
                            }
                        })
                    }
                }
            }
        }
    }
}

struct StackViews_Previews: PreviewProvider {
    static var previews: some View {
        StackViews()
    }
}


extension View {
    func cornerRadius(radius: CGFloat, corners: UIRectCorner) -> some View {
        ModifiedContent(content: self, modifier: CornerRadiusStyle(radius: radius, corners: corners))
    }
}

struct CornerRadiusStyle: ViewModifier {
    var radius: CGFloat
    var corners: UIRectCorner
    
    func body(content: Content) -> some View {
        content
            .clipShape(CornerRadiusShape(radius: radius, corners: corners))
    }
}

struct CornerRadiusShape: Shape {
    var radius = CGFloat.infinity
    var corners = UIRectCorner.allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}
