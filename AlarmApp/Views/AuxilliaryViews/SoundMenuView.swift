
import SwiftUI

struct SoundMenuView: View {
    @Binding var alarmSound: Sounds
    
    var body: some View {
        Form {
            Section(header: Text("Cool sounds")) {
                ForEach(Sounds.allCases, id: \.self) {sound in
                    Button(action: {
                        // change current sound to sound
                        alarmSound = sound
                        playSound(sound: sound.rawValue)
                    }, label: {
                        HStack {
                            Image(systemName: "checkmark")
                                .foregroundColor(pink)
                                .opacity(alarmSound == sound ? 1.0 : 0)
                            Text(sound.rawValue)
                                .foregroundColor(blue)
                                .fontWeight(.semibold)
                        }
                    })
                }
            }
        }
        .onDisappear {
            // stop music if we leave window
            stopSound()
        }
    }
}

struct SoundMenuViewFromButton: View {
    @Binding var alarmModel: AlarmModel
    
    var body: some View {
        NavigationLink(destination: {
            SoundMenuView(alarmSound: $alarmModel.sound)
        }, label: {
            HStack {
                Text("Sound").fontWeight(.semibold)
                Text(alarmModel.sound.rawValue)
                    .font(.caption)
                    .fontWeight(.thin)
            }.foregroundColor(white)
            .padding()
            .overlay(Capsule().stroke(white))
        })
    }
}

struct SoundMenu_Previews: PreviewProvider {
    static var previews: some View {
        //  SoundMenuView(alarmSound: .constant(AlarmModel.DefaultAlarm().sound))
        SoundMenuViewFromButton(alarmModel: .constant(AlarmModel.DefaultAlarm())).background(black)
    }
}
