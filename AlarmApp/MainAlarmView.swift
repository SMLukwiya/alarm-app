
import SwiftUI

struct MainAlarmView: View {
    @EnvironmentObject var lnManager: LocalNotificationsManager
    
    // update on every scene change
    @Environment(\.scenePhase) var scenePhase
    
    var body: some View {
        TabView {
            if lnManager.isAuthorized {
                ListOfAlarms()
                    .tabItem({
                        Label("", systemImage: "alarm.fill")
                    })
                AboutView()
                    .tabItem({
                        Label("About", systemImage: "info.circle.fill")
                    })
            } else {
                EnableNotifications()
            }
        }
        .ignoresSafeArea()
        .task {
            try? await lnManager.requestAuthorization()
        }
        .onChange(of: scenePhase) {newValue in
            if newValue == .active {
                Task {
                    await lnManager.getCurrentSettings()
                    await lnManager.getPendingAlarms()
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainAlarmView().environmentObject(LocalNotificationsManager())
    }
}
