
import SwiftUI

struct WakeUp: View {
    let currentAlarmIndex: Int?
    @State var alarmModel: AlarmModel
    
    var body: some View {
        VStack {
            CancelSaveAlarm(currentAlarmIndex: currentAlarmIndex, alarmModel: $alarmModel).foregroundColor(white)
            
            AlarmToggleView(alarmEnabled: $alarmModel.alarmEnabled)
            
            Divider()
            
            HStack {
                Grid {
                    GridRow {
                        TimeOfDayIcon(date: alarmModel.start)
                            .font(.title)
                        VStack(alignment: .leading) {
                            GrayedText(text: "start")
                            
                            TimePicker(time: $alarmModel.start, scale: 1.3)
                        }
                    }
                    
                    GridRow {
                        HStack {
                            Divider().frame(height: 30).padding(2)
                        }
                    }
                    
                    GridRow {
                        Image(systemName: alarmModel.activity)
                            .foregroundColor(alarmModel.activityColor)
                            .font(.headline)
                        
                        SelectActivity(currentColorIndex: $alarmModel.colorIndex, currentActivity: $alarmModel.activity)
                    }.padding(.vertical)
                    
                    GridRow {
                        HStack {
                            Divider().frame(height: 30).padding(2)
                        }
                    }
                    
                    GridRow {
                        TimeOfDayIcon(date: alarmModel.end).font(.title)
                        VStack(alignment: .leading) {
                            TimePicker(time: $alarmModel.end, scale: 1.3)
                            GrayedText(text: "end")
                        }
                    }
                    
                    GridRow {
                        Text("")
                        HStack {
                            Text("Sound").fontWeight(.semibold).foregroundColor(white)
                            Text(alarmModel.sound.rawValue).font(.caption).fontWeight(.thin).foregroundColor(white)
                        }
                        .padding(7)
                        .overlay(Capsule().stroke().fill(white))
                        .contextMenu {
                            ForEach(Sounds.allCases, id: \.self) { sound in
                                Button(action: {
                                    alarmModel.sound = sound
                                }, label: {
                                    Text(sound.rawValue)
                                })
                            }.padding(.vertical )
                        }
                    }
                }.frame(maxWidth: .infinity, alignment: .leading)
            }.padding()
        }.padding().background(darkGray.cornerRadius(20))
    }
}

struct WakeUp_Previews: PreviewProvider {
    static var previews: some View {
        WakeUp(currentAlarmIndex: nil, alarmModel: .DefaultAlarm())
    }
}
