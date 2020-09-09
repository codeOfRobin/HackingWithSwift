//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Robin Malhotra on 02/09/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
		ZStack {
			AngularGradient(gradient: Gradient(colors: [.red, .yellow, .green, .blue, .purple, .red]), center: .center)
			Text("Your content")

			Button("Tap me!") {
				print("Button was tapped")
			}

		}
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
