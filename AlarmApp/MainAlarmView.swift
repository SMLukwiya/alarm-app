
import SwiftUI

struct MainAlarmView: View {
    var body: some View {
        TabView {
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
