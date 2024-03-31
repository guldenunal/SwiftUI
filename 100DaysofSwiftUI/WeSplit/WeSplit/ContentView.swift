//
//  ContentView.swift
//  WeSplit
//
//  Created by /ᐠ-ꞈ-ᐟ\ on 20.03.2024.
//
import SwiftUI

struct ContentView: View {
    
    @FocusState private var amountIsFocused: Bool
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 20
    let tipPercentages = [10, 15, 20, 25, 0]
        
    var totalPerPerson: Double{
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentage)
        
        let tipAmount = checkAmount / 100 * tipSelection
        let totalAmount = checkAmount + tipAmount
        let amountPerPerson = totalAmount / peopleCount
        
        return amountPerPerson
    }
    var total: Double {
        let people = Double(numberOfPeople + 2)
        return people * totalPerPerson
    }
    var body: some View {
        NavigationStack{  Form{
            Section{
                TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                    .keyboardType(.decimalPad)
                    .focused($amountIsFocused)
                Picker("Number of people", selection: $numberOfPeople){
                    ForEach(2..<100){
                        Text("\($0) people")
                    }
                }
                .pickerStyle(.menu)
            }
            Section("How much tip do you want to leave?") {
                Picker("Tip percentage", selection: $tipPercentage){
                    ForEach(0..<101){
                        Text($0, format: .percent)
                    }
                }
                .pickerStyle(.navigationLink)
            }
            Section("Total Amount"){
                Text(total, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
            }
            Section("Amount per person"){
                Text(totalPerPerson,format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
            }
        }
        .navigationTitle("WeSplit")
        .toolbar {
            if amountIsFocused {
                Button("Done"){
                    amountIsFocused = false
                }
            }
        }
        }
    }
}

#Preview {
    ContentView()
}
