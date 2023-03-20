
import SwiftUI

struct AlarmRowButton: View {
    @EnvironmentObject var lnManager: LocalNotificationsManager
    
    let model: AlarmModel
    let i: Int
    @Binding var currentIndex: Int?
    @Binding var isActive: Bool
    
    var body: some View {
        HStack {
            Button(action: {
                currentIndex = i
                isActive.toggle()
            }, label: {
                HStack {
                    Image(systemName: model.activity)
                        .foregroundColor(model.activityColor)
                        .font(.title)
                    
                    Spacer()
                    
                    Text("\(getTimeFromDate(date: model.start)) - \(getTimeFromDate(date:model.end))")
                        .font(.title)
                        .fontWeight(model.alarmEnabled ? .regular : .thin)
                        .scaleEffect(model.alarmEnabled ? 1.05 : 1.0    )
                }
            })
            
            // Toggle switch
            Spacer()
            
            if i < lnManager.alarmModels.count {
                ToggleView(isOn: $lnManager.alarmModels[i].alarmEnabled)
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
        AlarmRowButton(model: .DefaultAlarm(), i: 0, currentIndex: .constant(0), isActive: .constant(false)).environmentObject(LocalNotificationsManager())
    }
}
