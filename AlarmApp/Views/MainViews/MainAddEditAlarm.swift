
import SwiftUI

struct MainAddEditAlarm: View {
    let currentAlarmIndex: Int?
    @State var alarmModel: AlarmModel
    
    @State private var selectedTab = "one"
    
    var body: some View {
        TabView(selection: $selectedTab) {
            AddEditAlarmView(currentAlarmIndex: currentAlarmIndex, alarmModel: alarmModel).tag("one")
            
            AddEditCircularAlarm(currentAlarmIndex: currentAlarmIndex, alarmModel: alarmModel).tag("two")
        }
        .onAppear() {
            UIPageControl
                .appearance()
                .currentPageIndicatorTintColor = .blue
        }
        .tabViewStyle(.page(indexDisplayMode: .always))
        .ignoresSafeArea()
    }
}

struct MainAddEditAlarm_Previews: PreviewProvider {
    static var previews: some View {
        MainAddEditAlarm(currentAlarmIndex: nil, alarmModel: .DefaultAlarm())
    }
}
