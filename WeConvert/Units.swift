
import Foundation

enum Units: String {
    case celcius = "celcius"
    case fahrenheit = "fahrenheit"
    case kelvin = "kelvin"
}

extension Units: CaseIterable { }

extension Units: Identifiable {
    var id: String { rawValue }
}
