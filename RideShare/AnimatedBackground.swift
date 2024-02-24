//
//  AnimatedBackground.swift
//  RideShare
//
//  Created by Bryan Ardon on 2/23/24.
//


import SwiftUI

struct AnimatedBackground: View {
    var body: some View {
        // Your animated background implementation goes here
        // For example, you can use a gradient or other animation techniques
        LinearGradient(gradient: Gradient(colors: [.red, .blue]), startPoint: .top, endPoint: .bottom)
            .animation(Animation.linear(duration: 2).repeatForever())
    }
}


struct AnimatedBackground_Previews: PreviewProvider {
    static var previews: some View {
        AnimatedBackground()
    }
}
