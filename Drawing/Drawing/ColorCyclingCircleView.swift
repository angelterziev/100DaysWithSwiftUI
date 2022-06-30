//
//  ColorCyclingCircleView.swift
//  Drawing
//
//  Created by Angel Terziev on 27.06.22.
//

import SwiftUI

struct ColorCyclingCircleView: View {
    var amount = 0.0
     var steps = 100

     var body: some View {
         ZStack {
             ForEach(0..<steps) { value in
                 Circle()
                     .inset(by: Double(value))
                     .strokeBorder(
                        LinearGradient(
                            gradient: Gradient(colors: [
                                color(for: value, brightness: 1),
                                color(for: value, brightness: 0.5)
                            ]),
                            startPoint: .top,
                            endPoint: .bottom
                        ),
                        lineWidth: 2)
             }
         }
         .drawingGroup()
     }

     func color(for value: Int, brightness: Double) -> Color {
         var targetHue = Double(value) / Double(steps) + amount

         if targetHue > 1 {
             targetHue -= 1
         }

         return Color(hue: targetHue, saturation: 1, brightness: brightness)
     }
}

struct ColorCyclingCircleView_Previews: PreviewProvider {
    static var previews: some View {
        ColorCyclingCircleView()
    }
}
