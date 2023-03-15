
import SwiftUI

struct CircularTimeIcon: View {
    let time: Date
    let size: CGFloat
    let percent: CGFloat
    
    var circularFrame = 40.0
    
    var body: some View {
        Circle()
            .fill(cardBackgroundColor)
            .frame(width: circularFrame, height: circularFrame)
            .overlay(TimeOfDayIcon(date: time))
            .rotation3DEffect(.degrees(-percent * 360), axis: (x: 0, y: 0, z: 1))
            .offset(y: -size / 2)
            .rotation3DEffect(.degrees(percent * 360), axis: (x: 0, y: 0, z: 1))    
    }
}

struct CircularTimeIcon_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            black.ignoresSafeArea()
            CircularTimeIcon(time: Date(), size: 200, percent: 0.5)
        }
    }
}
