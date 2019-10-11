import SwiftUI

struct ContentView: View {
    
    @State private var inputUnit: String = ""
    @State private var inputValue: String = ""
    @State private var outputUnit: String = ""
    
    var outputValue: Double {
        guard let inputUnit = TemperatureUnit.init(rawValue: inputUnit),
            let temperature = Double(inputValue),
            let outputUnit = TemperatureUnit.init(rawValue: outputUnit) else {
            return 0
        }
        let converter = TemperatureConverter(inputUnit: inputUnit, inputTemperature: temperature, outputUnit: outputUnit)
        return converter.outputTemperature
        
    }
        
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Convert from")) {
                    UnitPicker(unit: $inputUnit)
                    TextField("Temperature", text: $inputValue)
                        .keyboardType(.decimalPad)
                }
                Section(header: Text("To")) {
                    UnitPicker(unit: $outputUnit)
                }
                Section(header: Text("Result")) {
                    Text("\(outputValue, specifier: "%.2f")")
                }
            }.navigationBarTitle("We Convert")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
