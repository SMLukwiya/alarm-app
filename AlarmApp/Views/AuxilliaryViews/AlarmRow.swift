
import SwiftUI

struct AlarmRow: View {
    @EnvironmentObject var lnManager: LocalNotificationsManager
    
    let model: AlarmModel
    let i: Int
    var body: some View {
        HStack {
            Image(systemName: model.activity)
                .foregroundColor(model.activityColor)
                .font(.title)
            
            Text("\(getTimeFromDate(date: model.start)) - \(getTimeFromDate(date:model.end))")
                .font(.title)
                .fontWeight(model.alarmEnabled ? .regular : .thin)
                .scaleEffect(model.alarmEnabled ? 1.05 : 1.0    )
            
            Spacer()
            
            if i < lnManager.alarmModels.count {
                ToggleView(isOn: .constant(lnManager.alarmModels[i].alarmEnabled))
            }
        }
        .onChange(of: model.alarmEnabled) { alarmEnabled in
            if alarmEnabled {
                Task {
                    await lnManager.schedule(localNotification: model)
                }
            } else {
                lnManager.removeRequest(id: model.id)
            }
        }
    }
}

struct AlarmRow_Previews: PreviewProvider {
    static var previews: some View {
        AlarmRow(model: .DefaultAlarm(), i: 0).environmentObject(LocalNotificationsManager())
    }
}
