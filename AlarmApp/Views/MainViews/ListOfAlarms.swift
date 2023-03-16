
import SwiftUI

struct ListOfAlarms: View {
    @EnvironmentObject var lnManager: LocalNotificationsManager
    @State var isActive = false
    @State var currentIndex: Int? = nil
    
    var body: some View {
        NavigationStack {
            ZStack {
                List {
                    ForEach(lnManager.alarmModels.indices) { i in
                        Button(action: {
                            currentIndex = i
                        }, label: {
                            AlarmRow(model: lnManager.alarmModels[i], i: i)
                        })
                    }
                    .onDelete(perform: delete)
                }
            }
            .navigationTitle("Alarm List")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: {
                        MainAddEditAlarm(currentAlarmIndex: nil, alarmModel: .DefaultAlarm())
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
            
        }
        
        // remove from alarmModels
        lnManager.alarmModels.remove(atOffsets: offsets)
    }
}

struct ListOfAlarms_Previews: PreviewProvider {
    static var previews: some View {
        ListOfAlarms().environmentObject(LocalNotificationsManager())
    }
}
