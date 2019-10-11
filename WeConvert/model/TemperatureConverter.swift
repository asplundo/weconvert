import Foundation

struct TemperatureConverter {
    
    var inputUnit: TemperatureUnit
    var inputTemperature: Double
    var outputUnit: TemperatureUnit
    
    var outputTemperature: Double {
        let celcius = inCelcius
        let temperature: Measurement<UnitTemperature>
        switch outputUnit {
        case .fahrenheit:
            temperature = celcius.converted(to: .fahrenheit)
        case .kelvin:
            temperature = celcius.converted(to: .kelvin)
        case .celcius:
            temperature = celcius
        }
        return temperature.value
        
    }
    
    private var inCelcius: Measurement<UnitTemperature> {
        let measurement: Measurement<UnitTemperature>
        switch inputUnit {
        case .fahrenheit:
            measurement = Measurement(value: inputTemperature, unit: UnitTemperature.fahrenheit)
        case .kelvin:
            measurement = Measurement(value: inputTemperature, unit: UnitTemperature.kelvin)
        case .celcius:
            measurement = Measurement(value: inputTemperature, unit: UnitTemperature.celsius)
        }
        return measurement.converted(to: .celsius)
    }
}
