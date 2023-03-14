
import SwiftUI

struct CenterDatePicker: View {
    let size: CGFloat
    @Binding var alarmModel: AlarmModel
    var lineWidth: CGFloat = 10.0
    
    var startTime: Date {
        alarmModel.start
    }
    
    var endTime: Date {
        alarmModel.end
    }
    
    var startDateToPercent: CGFloat {
        dateToPercent(date: startTime)
    }
    
    var endDateToPercent: CGFloat {
        startDateToPercent + percentDifference
    }
    
    var percentDifference: CGFloat {
        let value = dateToPercent(date: endTime) - dateToPercent(date: startTime)
        //value can be a negative
        return value >= 0 ? value : 1 + value
    }
    
    var rotateCircleOffset: CGFloat {
        // create the arc
        360 * startDateToPercent
    }
    
    var body: some View {
        Circle()
            .stroke(lightGray, lineWidth: lineWidth)
            .frame(width: size, height: size)
            .overlay(
                VStack {
                    VStack {
                        GrayedText(text: "start", font: .caption)
                        TimePicker(time: $alarmModel.start.animation(), scale: 1)
                    }
                    Spacer()
                    GrayedText(text: "set alarm")
                    Spacer()
                    VStack {
                        TimePicker(time: $alarmModel.end.animation(), scale: 1)
                        GrayedText(text: "end", font: .caption)
                    }
                }.padding().padding(.vertical)
            )
    }
}

struct CenterTimePicker_Previews: PreviewProvider {
    static var previews: some View {
        CenterDatePicker(size: 200, alarmModel:  .constant(AlarmModel.DefaultAlarm()))
    }
}
