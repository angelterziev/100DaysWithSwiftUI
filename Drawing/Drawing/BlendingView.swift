//
//  BlendingView.swift
//  Drawing
//
//  Created by Angel Terziev on 27.06.22.
//

import SwiftUI


struct BlendingView: View {

    struct Layout {
        static let width = 300.0
        static let offsetX = 60.0
        static let offsetY = 120.0
    }

    var amount:Double
    
    var body: some View {
            ZStack {
                Circle()
                    .fill(Color(red: 1, green: 0, blue: 0))
                    .frame(width: Layout.width * amount)
                    .offset(x: -Layout.offsetX, y: -Layout.offsetY)
                    .blendMode(.screen)

                Circle()
                    .fill(Color(red: 0, green: 1, blue: 0))
                    .frame(width: Layout.width * amount)
                    .offset(x: Layout.offsetX, y: -Layout.offsetY)
                    .blendMode(.screen)

                Circle()
                    .fill(Color(red: 0, green: 0, blue: 1))
                    .frame(width: Layout.width * amount)
                    .blendMode(.screen)
            }
            .frame(width: 300, height: 300)
    }
}

struct BlendingView_Previews: PreviewProvider {
    static var previews: some View {
        BlendingView(amount: 2.3)
    }
}
