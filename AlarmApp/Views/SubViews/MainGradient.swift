
import SwiftUI

struct MainGradient: View {
    var startRadius: CGFloat = 0.0
    let endRadius: CGFloat
    var scaleX: CGFloat = 2.0
    var opacityLinearGradient = 0.7
    var colorYellow: Color = .yellow
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [blue, pink], startPoint: .topLeading, endPoint: .bottomTrailing)
                .opacity(opacityLinearGradient)
        }
    }
}

struct MainGradient_Previews: PreviewProvider {
    static var previews: some View {
        MainGradient(endRadius: 75.0).frame(width: screenWidth, height: screenHeight/5)
    }
}
