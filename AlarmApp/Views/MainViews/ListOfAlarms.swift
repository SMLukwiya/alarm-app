
import SwiftUI

struct ListOfAlarms: View {
    var alarmListModels: [AlarmModel]
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(0..<5) { _ in
                    let model = alarmListModels[0]
                    
                    NavigationLink(destination: {
                        Text("data for alarm")
                    }, label: {
                        HStack {
                            Image(systemName: model.activity)
                                .foregroundColor(model.activityColor)
                            Text("Alarm row view")
                        }
                    })
                }
            }
            .navigationTitle("Alarm List")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: {
                        Text("Create new Alarm")
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
