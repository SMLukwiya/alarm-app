
import SwiftUI

struct CenterDatePicker: View {
    let size: CGFloat
    @Binding var alarmModel: AlarmModel
    var lineWidth: CGFloat = 10.0
    
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
        CenterDatePicker(size: 200, alarmModel:      .constant(AlarmModel.DefaultAlarm()))
    }
}
