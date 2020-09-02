//
//  ContentView.swift
//  WeSplit
//
//  Created by Robin Malhotra on 17/08/20.
//

import SwiftUI

struct ContentView: View {
	@State private var checkAmount = ""
	@State private var numberOfPeople = 2
	@State private var tipPercentage = 2

	let tipPercentages = [10, 15, 20, 25, 0]

	var totalPerPerson: Double {
		let peopleCount = Double(numberOfPeople + 2)
		let tipSelection = Double(tipPercentages[tipPercentage])

		let orderAmount = Double(checkAmount) ?? 0

		let tip = tipSelection / 100 * orderAmount
		let totalBill = orderAmount + tip
		return totalBill / peopleCount
	}

	var body: some View {
		NavigationView {
			Form {
				Section {
					TextField("Amount", text: $checkAmount)
						.keyboardType(.decimalPad)
				}
				Section(header: Text("How much tip do you want to leave?")) {
					Picker("Tip percentage", selection: $tipPercentage) {
						ForEach(0 ..< tipPercentages.count) {
							Text("\(self.tipPercentages[$0])%")
						}
					}
					.pickerStyle(SegmentedPickerStyle())
				}
				Picker("Number of people", selection: $numberOfPeople) {
					ForEach(2 ..< 100) {
						Text("\($0) people")
					}
				}

				Section {
					Text("$\(totalPerPerson, specifier: "%.2f")")   
				}
			}.navigationBarTitle("WeSplit")
		}
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}
