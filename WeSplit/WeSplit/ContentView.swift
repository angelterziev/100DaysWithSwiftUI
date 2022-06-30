//
//  ContentView.swift
//  WeSplit
//
//  Created by Angel Terziev on 7.06.22.
//

import SwiftUI

enum TUnit : String, CaseIterable {
    case celsius = "C"
    case fahrenheit = "F"
    case kelvin = "K"
}

struct TConversion {
    var inputUnit: TUnit
    var outputUnit: TUnit
    var inputValue: Double
}

struct ContentView: View {

    @State private var temperature = TConversion(inputUnit: .celsius,
                                                 outputUnit: .fahrenheit,
                                                 inputValue: 10.0)

    @FocusState private var tempIsFocused: Bool
    
    var convertedTemperature: String {
        return convertTemperature(from: temperature.inputUnit, to: temperature.outputUnit, amount: temperature.inputValue).formatted()
    }

    private func convertTemperature(from: TUnit, to: TUnit, amount: Double) -> Double {
        return convertFromCelsius(to: to, amount: convertToCelsius(from: from, amount: amount))
    }
    
    private func convertToCelsius(from: TUnit, amount: Double) -> Double {
        switch from {
        case .celsius:
            return amount
        case .fahrenheit:
            return (amount - 32.0) / 1.8
        case .kelvin:
            return amount - 273.15
        }
    }

    private func convertFromCelsius(to: TUnit, amount: Double) -> Double {
        switch to {
        case .celsius:
            return amount
        case .fahrenheit:
            return 1.8 * amount + 32
        case .kelvin:
            return amount + 273.15
        }
    }

    var body: some View {
        NavigationView {
            Form {
                Section {
                    HStack {
                        TextField("Temperature", value: $temperature.inputValue, format: .number)
                            .focused($tempIsFocused)
                            .keyboardType(.numbersAndPunctuation)
                        Spacer()
                        Picker("Pick", selection: $temperature.inputUnit) {
                            ForEach(TUnit.allCases, id: \.self) {
                                Text($0.rawValue)
                            }
                        }
                        .pickerStyle(.segmented)
                    }
                    HStack {
                        Spacer()
                        Text("is")
                        Spacer()
                    }
                    HStack {
                        Text(convertedTemperature)
                        Spacer()
                        Picker("Pick", selection: $temperature.outputUnit) {
                            ForEach(TUnit.allCases, id: \.self) {
                                Text($0.rawValue)
                            }
                        }
                        .pickerStyle(.segmented)
                    }
                } header: {
                    Text("Temperature conversion")
                }
                
                Section {
                } header: {
                    Text("Length conversion")
                }
                
                Section {
                } header: {
                    Text("Time conversion")
                }

                Section {
                } header: {
                    Text("Volume conversion")
                }
            }
            .navigationTitle("Unit Conversions")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button("Done") {
                        tempIsFocused = false
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.portrait)
    }
}
