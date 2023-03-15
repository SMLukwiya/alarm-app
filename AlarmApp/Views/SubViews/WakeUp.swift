
import SwiftUI

struct WakeUp: View {
    let currentAlarmIndex: Int?
    @State var alarmModel: AlarmModel
    
    var body: some View {
        NavigationStack {
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
                            SoundMenuViewFromButton(alarmModel: $alarmModel)
                        }
                    }.frame(maxWidth: .infinity, alignment: .leading)
                }.padding()
            }.padding().background(darkGray.cornerRadius(20))
        }
    }
}

struct WakeUp_Previews: PreviewProvider {
    static var previews: some View {
        WakeUp(currentAlarmIndex: nil, alarmModel: .DefaultAlarm())
    }
}
