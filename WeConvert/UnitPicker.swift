import SwiftUI

struct UnitPicker: View {
    
    @Binding var unit: String
    
    var body: some View {
        Picker("Unit", selection: $unit) {
            List(Units.allCases) { unit in
                Text(unit.rawValue)
            }
        }.pickerStyle(SegmentedPickerStyle())
    }
}

struct UnitPicker_Previews: PreviewProvider {
    static var previews: some View {
        Form {
            UnitPicker(unit: .constant("Units.celcius.rawValue"))
        }
        
    }
}
