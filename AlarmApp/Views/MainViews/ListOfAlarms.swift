
import SwiftUI

struct ListOfAlarms: View {
    var alarmListModels: [AlarmModel]
    
    var body: some View {
        NavigationStack {
            ZStack {
                List {
                    ForEach(0..<5) { i in
                        let model = alarmListModels[0]
                        
                        NavigationLink(destination: {
                            MainAddEditAlarm(currentAlarmIndex: i, alarmModel: .DefaultAlarm())
                        }, label: {
                            AlarmRow(model: model, i: 0)
                        })
                    }
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
}

struct ListOfAlarms_Previews: PreviewProvider {
    static var previews: some View {
        ListOfAlarms(alarmListModels: AlarmModel.DummyAlarmData())
    }
}
