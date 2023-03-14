
import SwiftUI

struct AddEditAlarmView: View {
    let currentAlarmIndex: Int?
    @State var alarmModel: AlarmModel
    @State private var showYouDidItView = true
    
    var body: some View {
        ZStack {
            backgroundColor.opacity(0.3).ignoresSafeArea()
            
            VStack {
                if showYouDidItView {
                    YouDidIt()
                }
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                showYouDidItView = false
            }
        }
    }
}

struct AddEditAlarm_Previews: PreviewProvider {
    static var previews: some View {
        AddEditAlarmView(currentAlarmIndex: nil, alarmModel: .DefaultAlarm())
    }
}
