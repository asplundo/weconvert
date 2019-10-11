import Foundation

struct TemperatureConverter {
    
    var inputUnit: TemperatureUnit
    var inputTemperature: Double
    var outputUnit: TemperatureUnit
    
    var outputTemperature: Double {
        let celcius = inCelcius
        let temperature: Double
        switch outputUnit {
        case .fahrenheit:
            temperature = (celcius * 1.8) + 32
        case .kelvin:
            temperature = celcius + 273.15
        case .celcius:
            temperature = celcius
        }
        return temperature
        
    }
    
    private var inCelcius: Double {
        let celcius: Double
        switch inputUnit {
        case .fahrenheit:
            celcius = (inputTemperature - 32) / 1.8
        case .kelvin:
            celcius = inputTemperature - 273.15
        case .celcius:
            celcius = inputTemperature
        }
        return celcius
    }
}
