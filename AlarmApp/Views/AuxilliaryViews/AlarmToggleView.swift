
import SwiftUI

struct AlarmToggleView: View {
    @Binding var alarmEnabled: Bool
    
    var body: some View {
        HStack {
            GrayedText(text: "toggle", color: lightGray)
            Spacer( )
            ToggleView(isOn: $alarmEnabled)
        }
    }
}

struct AlarmToggle_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            AlarmToggleView(alarmEnabled: .constant(true))
            AlarmToggleView(alarmEnabled: .constant(false))
        }.padding()
    }
}
