//
//  LocationAnnotation.swift
//  GeofencingFlow
//
//  Created by Jiri Urbasek on 2/4/21.
//

import SwiftUI
import MapKit

struct LocationAnnotation: View {
    var body: some View {
        Circle()
            .strokeBorder(Color.primary, lineWidth: 2)
            .frame(width: 160, height: 160)
            .padding(4)
            .overlay(
                Circle()
                    .fill(Color.primary)
                    .frame(width: 15, height: 15)
                //.padding(50)
            )
            .overlay(
                Line()
                    .stroke(style: StrokeStyle(lineWidth: 2, dash: [4]))
                    .frame(width: 80, height: 1)
                ,
                alignment: .trailing
            )
            .overlay(
                Circle()
                    .fill(Color.primary)
                    .frame(width: 10, height: 10)
                ,
                alignment: .trailing
            )
    }
}

struct Line: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: rect.width, y: 0))
        return path
    }
}

struct LocationAnnotation_Previews: PreviewProvider {
    static var previews: some View {
        LocationAnnotation()
            .previewLayout(.fixed(width: 200, height: 200))
    }
}
