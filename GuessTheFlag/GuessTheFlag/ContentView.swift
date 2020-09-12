//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Robin Malhotra on 02/09/20.
//

import SwiftUI

struct ContentView: View {
	@State private var showingAlert = false
	var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
	var correctAnswer = Int.random(in: 0...2)
	@State private var showingScore = false
	@State private var scoreTitle = ""

	func flagTapped(_ number: Int) {
		if number == correctAnswer {
			scoreTitle = "Correct"
		} else {
			scoreTitle = "Wrong"
		}

		showingScore = true
	}
	
	var body: some View {
		ZStack {
			Color.blue.edgesIgnoringSafeArea(.all)
			VStack(spacing: 30) {
				VStack {
					Text("Tap the flag of")
						.foregroundColor(.white)
					Text(countries[correctAnswer])
						.foregroundColor(.white)
				}
				ForEach(0 ..< 3) { number in
					Button(action: {
					   // flag was tapped
					}) {
						Image(self.countries[number])
							.renderingMode(.original)
					}
				}
				Spacer()
			}
		}
	}

}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}
