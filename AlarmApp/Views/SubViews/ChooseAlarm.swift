
import SwiftUI

enum AddEditViewType {
    case standard, circular
}

struct ChooseAlarm: View {
    @Binding var currentAlarmIndex: Int?
    @EnvironmentObject var lnManager: LocalNotificationsManager
    let addEditViewType: AddEditViewType
    
    var body: some View {
        if let currentAlarmIndex = currentAlarmIndex {
            if addEditViewType == .standard {
                AddEditAlarmView(currentAlarmIndex: currentAlarmIndex, alarmModel: lnManager.alarmModels[currentAlarmIndex])
            } else {
                AddEditCircularAlarm(currentAlarmIndex: currentAlarmIndex, alarmModel: .DefaultAlarm())
            }
        } else {
            if addEditViewType == .standard {
                AddEditAlarmView(currentAlarmIndex: currentAlarmIndex, alarmModel: .DefaultAlarm())
            } else {
                AddEditCircularAlarm(currentAlarmIndex: currentAlarmIndex, alarmModel: .DefaultAlarm())
            }
        }
    }
}

struct ChooseAlarm_Previews: PreviewProvider {
    static var previews: some View {
        ChooseAlarm(currentAlarmIndex: .constant(nil), addEditViewType: .standard)
    }
}
