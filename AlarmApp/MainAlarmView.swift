
import SwiftUI

struct MainAlarmView: View {
    var body: some View {
        TabView {
        //AddEditAlarmView(currentAlarmIndex: 0, alarmModel: .DefaultAlarm())
            ListOfAlarms(alarmListModels: AlarmModel.DummyAlarmData())
                .tabItem({
                    Label("", systemImage: "alarm.fill")
                })
            AboutView()
                .tabItem({
                    Label("About", systemImage: "info.circle.fill")
                })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainAlarmView()
    }
}
