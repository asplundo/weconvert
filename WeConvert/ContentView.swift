import SwiftUI

struct ContentView: View {
    
    @State private var inputUnit: String = ""
    @State private var inputValue: String = ""
    @State private var outputUnit: String = ""
    
    var outputValue: Double {
        guard let unit = Units.init(rawValue: inputUnit),
            let input = Double(inputValue),
            let outUnit = Units.init(rawValue: outputUnit) else {
            return 0
        }
        
        let degreesCelcius = celcius(from: input, unit: unit)
        return degress(degreesCelcius, unit: outUnit)
        
    }
    
    func celcius(from degress: Double, unit: Units) -> Double {
        let celcius: Double
        switch unit {
        case .fahrenheit:
            celcius = (degress - 32) / 1.8
        case .kelvin:
            celcius = degress - 273.15
        case .celcius:
            celcius = degress
        }
        return celcius
    }
    
    func degress(_ celcius: Double, unit: Units) -> Double {
        let degrees: Double
        switch unit {
        case .fahrenheit:
            degrees = (celcius * 1.8) + 32
        case .kelvin:
            degrees = celcius + 273.15
        case .celcius:
            degrees = celcius
        }
        return degrees
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Convert from")) {
                    UnitPicker(unit: $inputUnit)
                    TextField("Degrees", text: $inputValue)
                        .keyboardType(.decimalPad)
                }
                Section(header: Text("Convert to")) {
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
