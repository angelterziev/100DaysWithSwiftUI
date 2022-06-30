//
//  Flower.swift
//  Drawing
//
//  Created by Angel Terziev on 27.06.22.
//

import SwiftUI

struct Flower: Shape {
    // How much to move this petal away from the center
    var petalOffset: Double = -20

    // How wide to make each petal
    var petalWidth: Double = 100

    func path(in rect: CGRect) -> Path {
        return flower(in: rect)
    }
    
    private func flower(in rect: CGRect) -> Path {
        // The path that will hold all petals
        var path = Path()

        // Count from 0 up to pi * 2, moving up pi / 8 each time
        for number in stride(from: 0, to: Double.pi * 2, by: Double.pi / 8 ) {
            print("Flower.path, number: \(number)")
            // rotate the petal by the current value of our loop
            let rotation = CGAffineTransform(rotationAngle: number)

            // move the petal to be at the center of our view
            let translation = CGAffineTransform(translationX: rect.width / 2, y: rect.height / 2)
            let position = rotation.concatenating(translation)


            // create a path for this petal using our properties plus a fixed Y and height
            let originalPetal = Path(ellipseIn: CGRect(x: petalOffset, y: 0, width: petalWidth, height: rect.width / 2))

            // apply our rotation/position transformation to the petal
            let rotatedPetal = originalPetal.applying(position)

            // add it to our main path
            path.addPath(rotatedPetal)
        }

        // now send the main path back
        return path
    }
    
    private func ellipse(in rect: CGRect) -> Path {
        // The path that will hold all petals
        var path = Path()

        for number in stride(from: Double.pi, to: Double.pi * 2, by: Double.pi  ) {
            print("Flower.path, number: \(number)")
            // rotate the petal by the current value of our loop
            let rotation = CGAffineTransform(rotationAngle: number)

            // move the petal to be at the center of our view
            let translation = CGAffineTransform(translationX: rect.width / 2, y: rect.height / 2)
            let position = rotation.concatenating(translation)

            // create a path for this petal using our properties plus a fixed Y and height
            let originalPetal = Path(ellipseIn: CGRect(x: petalOffset, y: 0, width: petalWidth, height: rect.width / 2))

            // apply our rotation/position transformation to the petal
            let rotatedPetal = originalPetal.applying(position)

            // add it to our main path
            path.addPath(rotatedPetal)
        }
        // now send the main path back
        return path
    }
}
