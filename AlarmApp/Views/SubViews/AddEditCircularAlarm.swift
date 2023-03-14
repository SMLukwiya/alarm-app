
import SwiftUI

struct AddEditCircularAlarm: View {
    let currentAlarmIndex: Int?
    @State var alarmModel: AlarmModel
    
    var body: some View {
        VStack {
            CancelSaveAlarm(currentAlarmIndex: currentAlarmIndex, alarmModel: $alarmModel)
            
            AlarmToggleView(alarmEnabled: $alarmModel.alarmEnabled)
            Divider()
            Spacer()
            
            CircularTime(currentAlarmIndex: currentAlarmIndex, alarmModel:  alarmModel, size: screenWidth/2 )
            Spacer()
        }       
    }
}

struct AddEditCircularAlarm_Previews: PreviewProvider {
    static var previews: some View {
        AddEditCircularAlarm(currentAlarmIndex: nil, alarmModel: .DefaultAlarm())
    }
}
