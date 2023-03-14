
import SwiftUI

struct AlarmRow: View {
    let model: AlarmModel
    let i: Int
    var body: some View {
        HStack {
            Image(systemName: model.activity)
                .foregroundColor(model.activityColor)
                .font(.title)
            
            Text("\(getTimeFromDate(date:model.end))")
                .font(.title)
                .fontWeight(model.alarmEnabled ? .regular : .thin)
                .scaleEffect(model.alarmEnabled ? 1.05 : 1.0    )
            
            Spacer()
            
            ToggleView(isOn: .constant(AlarmModel.DummyAlarmData()[i].alarmEnabled))
        }.padding(.vertical)
    }
}

struct AlarmRow_Previews: PreviewProvider {
    static var previews: some View {
        AlarmRow(model: .DefaultAlarm(), i: 0)
    }
}
