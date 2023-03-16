
import SwiftUI

struct CancelSaveAlarm: View {
    let currentAlarmIndex: Int?
    @Binding var alarmModel: AlarmModel
    @EnvironmentObject var lnManager: LocalNotificationsManager
    
    // we dismiss the view after saving or cancelling
    @Environment(\.presentationMode) var presentation
    
    var body: some View {
        HStack {
            Button(action: {
                self.presentation.wrappedValue.dismiss()
            }, label: {
                Text("cancel")
            })
            
            Spacer()
            
            Button(action: {
                if let currentAlarmIndex = currentAlarmIndex {
                    // save edited alarm
                    lnManager.alarmModels[currentAlarmIndex] = alarmModel
                } else {
                    // apend new alarm
                    lnManager.safeAppend(localNotification: alarmModel)
                }
                // immediately schedule alarm if it is enabled
                Task {
                    if alarmModel.alarmEnabled {
                        await lnManager.schedule(localNotification: alarmModel)
                    } else {
                        lnManager.removeRequest(id: alarmModel.id)
                    }
                }
                self.presentation.wrappedValue.dismiss()
            }, label: {
                Text("Save")
            })
        }
    }
}

struct CancelSaveAlarm_Previews: PreviewProvider {
    static var previews: some View {
        CancelSaveAlarm(currentAlarmIndex: nil, alarmModel: .constant(.DefaultAlarm())).environmentObject(LocalNotificationsManager())
    }
}
