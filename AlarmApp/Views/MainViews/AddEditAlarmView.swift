
import SwiftUI

struct AddEditAlarmView: View {
    let currentAlarmIndex: Int?
    @State var alarmModel: AlarmModel
    @State private var showYouDidItView = true
    
    var body: some View {
        ZStack {
            black.ignoresSafeArea()
            
            VStack {
                if showYouDidItView {
                    YouDidIt()
                }
                WakeUp(currentAlarmIndex: currentAlarmIndex, alarmModel: alarmModel)
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                withAnimation {
                    showYouDidItView = false
                }
            }
        }
    }
}

struct AddEditAlarm_Previews: PreviewProvider {
    static var previews: some View {
        AddEditAlarmView(currentAlarmIndex: nil, alarmModel: .DefaultAlarm())
    }
}
