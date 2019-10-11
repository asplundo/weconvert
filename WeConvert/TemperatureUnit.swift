
import Foundation

enum TemperatureUnit: String {
    case celcius = "celcius"
    case fahrenheit = "fahrenheit"
    case kelvin = "kelvin"
}

extension TemperatureUnit: CaseIterable { }

extension TemperatureUnit: Identifiable {
    var id: String { rawValue }
}
