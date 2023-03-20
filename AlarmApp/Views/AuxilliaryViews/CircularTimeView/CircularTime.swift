
import SwiftUI

struct CircularTime: View {
    let currentAlarmIndex: Int?
    @Binding var alarmModel: AlarmModel
    
    let size: CGFloat
    
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
        ZStack {
            CenterDatePicker(size: size, alarmModel: $alarmModel)
            
            // progression
            TimeArc(percentDifference: percentDifference,
                    strokeStyle: StrokeStyle(lineWidth: 15, lineCap: .round, lineJoin: .round),
                    size: size,
                    rotateCircleOffset: rotateCircleOffset, color: pink)
            // progression overlay
            TimeArc(percentDifference: percentDifference,
                    strokeStyle: StrokeStyle(lineWidth: 15, dash: [1,2]),
                    size: size,
                    rotateCircleOffset: rotateCircleOffset, color: .gray)
            
            // First Icon
            CircularTimeIcon(time: startTime, size: size, percent: startDateToPercent)
            
            //Second Icon
            CircularTimeIcon(time: endTime, size: size, percent: endDateToPercent)
            
        }.padding(50).background(darkGray).cornerRadius(25)
    }
}

struct CircularTime_Previews: PreviewProvider {
    static var previews: some View {
        CircularTime(currentAlarmIndex: nil, alarmModel: .constant(.DefaultAlarm()), size: screenWidth/2)
    }
}
