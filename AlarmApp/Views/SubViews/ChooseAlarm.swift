
import SwiftUI

struct ChooseAlarm: View {
    @Binding var currentAlarmIndex: Int?
    @EnvironmentObject var lnManager: LocalNotificationsManager
    
    var body: some View {
        if let currentAlarmIndex = currentAlarmIndex {
            AddEditAlarmView(currentAlarmIndex: currentAlarmIndex, alarmModel: lnManager.alarmModels[currentAlarmIndex] )
        } else {
            AddEditAlarmView(currentAlarmIndex: currentAlarmIndex, alarmModel: .DefaultAlarm())
        }
    }
}

struct ChooseAlarm_Previews: PreviewProvider {
    static var previews: some View {
        ChooseAlarm(currentAlarmIndex: .constant(nil))
    }
}
