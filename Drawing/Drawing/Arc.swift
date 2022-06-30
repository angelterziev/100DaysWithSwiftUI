//
//  Arc.swift
//  Drawing
//
//  Created by Angel Terziev on 27.06.22.
//

import SwiftUI

struct Arc: InsettableShape {
    var startAngle: Angle
    var endAngle: Angle
    var clockwise: Bool
    var insetAmount = 0.0

    func path(in rect: CGRect) -> Path {
        let rotationAdjustment = Angle.degrees(90)
        let modifiedStart = startAngle - rotationAdjustment
        let modifiedEnd = endAngle - rotationAdjustment

        let center = CGPoint(x: rect.midX, y: rect.midY)
        let radius = rect.width / 2 - insetAmount
        var path = Path()

        path.addArc(center: center, radius: radius, startAngle: modifiedStart, endAngle: modifiedEnd, clockwise: !clockwise)

        // No modifications, but wierd results
        //path.addArc(center: center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: clockwise)
          
        print("rect: \(rect)")
        print("center: \(center)")
        return path
    }
    
    
    func inset(by amount: CGFloat) -> some InsettableShape {
        var arc = self
        arc.insetAmount += amount
        return arc
    }

}
