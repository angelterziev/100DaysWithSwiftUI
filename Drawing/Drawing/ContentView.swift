//
//  ContentView.swift
//  Drawing
//
//  Created by Angel Terziev on 26.06.22.
//

import SwiftUI


struct ContentView: View {
    
    @State private var amount = 0.0
    
    var body: some View {
        VStack {
            BlendingView(amount: amount)
            
            Slider(value: $amount).padding()
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.black)
        .ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
