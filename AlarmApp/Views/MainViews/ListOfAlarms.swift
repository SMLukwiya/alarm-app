
import SwiftUI

struct ListOfAlarms: View {
    @EnvironmentObject var lnManager: LocalNotificationsManager
    @State var isActive = false
    @State var currentIndex: Int? = nil
    
    var body: some View {
        NavigationStack {
            ZStack {
                List {
                    ForEach(lnManager.alarmModels.indices, id: \.self) { i in
                        Button(action: {
                            currentIndex = i
                            isActive.toggle()
                        }, label: {
                            AlarmRow(model: lnManager.alarmModels[i], i: i).padding(.vertical)
                        })
                    }
                    .onDelete(perform: delete)
                }
            }
            .navigationTitle("Alarm List")
            .sheet(isPresented: $isActive,onDismiss: {}) {
                // Edit the currentIndex alarm
                wrapAddEditAlarmView(currentAlarmIndex: $currentIndex)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        isActive.toggle()
                    }, label: {
                        Text("+")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(blue)
                    })
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()    
                }
            }
        }
    }
    
    func delete(offsets: IndexSet) {
        // Remove from list of pending alarms
        for index in offsets {
            lnManager.removeRequest(id: lnManager.alarmModels[index].id )
        }
        
        // remove from alarmModels
        lnManager.alarmModels.remove(atOffsets: offsets)
    }
}

struct wrapAddEditAlarmView: View {
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

struct ListOfAlarms_Previews: PreviewProvider {
    static var previews: some View {
        ListOfAlarms().environmentObject(LocalNotificationsManager())
    }
}
