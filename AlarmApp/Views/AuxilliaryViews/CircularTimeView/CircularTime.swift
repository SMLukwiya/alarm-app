
import SwiftUI

struct CircularTime: View {
    let currentAlarmIndex: Int?
    @State var alarmModel: AlarmModel
    let size: CGFloat
    
    var body: some View {
        Circle()
            .stroke(lineWidth: 20)
            .frame(width: size)
            .overlay(Text("Circular"))
    }
}

struct CircularTime_Previews: PreviewProvider {
    static var previews: some View {
        CircularTime(currentAlarmIndex: nil, alarmModel: .DefaultAlarm(), size: screenWidth/2)
    }
}
