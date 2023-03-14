
import SwiftUI

struct CancelSaveAlarm: View {
    let currentAlarmIndex: Int?
    @Binding var alarmModel: AlarmModel
    
    var body: some View {
        HStack {
            Button(action: {
                
            }, label: {
                Text("cancel")
            })
            
            Spacer()
            
            Button(action: {
                if let currentAlarmIndex = currentAlarmIndex {
                    // TODO: Edit alarm to view model
                } else {
                    // TODO: Add alarm
                }
            }, label: {
                Text("Save")
            })
        }
    }
}

struct CancelSaveAlarm_Previews: PreviewProvider {
    static var previews: some View {
        CancelSaveAlarm(currentAlarmIndex: nil, alarmModel: .constant(.DefaultAlarm()   ))
    }
}
