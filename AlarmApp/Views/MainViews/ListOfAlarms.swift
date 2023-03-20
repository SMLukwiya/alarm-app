
import SwiftUI

struct ListOfAlarms: View {
    @EnvironmentObject var lnManager: LocalNotificationsManager
    @State var isActive = false
    @State var currentIndex: Int? = nil
    @State var addEditViewType: AddEditViewType = .standard         
    
    var body: some View {
        NavigationStack {
            ZStack {
                List {
                    ForEach(lnManager.alarmModels.indices, id: \.self) { i in
                        AlarmRowButton(model: lnManager.alarmModels[i], i: i, currentIndex: $currentIndex, isActive: $isActive).padding(.vertical)
                    }
                    .onDelete(perform: delete)
                }
            }
            .navigationTitle("Alarm List")
            .sheet(isPresented: $isActive,onDismiss: {}) {
                // Edit the currentIndex alarm
                ChooseAlarm(currentAlarmIndex: $currentIndex, addEditViewType: addEditViewType)
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

struct ListOfAlarms_Previews: PreviewProvider {
    static var previews: some View {
        ListOfAlarms().environmentObject(LocalNotificationsManager())
    }
}
