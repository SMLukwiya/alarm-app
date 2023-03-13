
import SwiftUI

struct MainGradient: View {
    var startRadius: CGFloat = 0.0
    let endRadius: CGFloat
    var scaleX: CGFloat = 2.0
    var opacityLinearGradient = 0.5
    var opacityRadialGradient = 1.0
    var colorYellow: Color = .yellow
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [.blue, blue, .purple.opacity(0.5)], startPoint: .top, endPoint: .bottom)
                .opacity(opacityLinearGradient)
            
            RadialGradient(
                colors: [blue, .clear],
                center: .bottom,
                startRadius: startRadius,
                endRadius: endRadius)
            .opacity(opacityRadialGradient)
            .scaleEffect(x: scaleX)
        }
    }
}

struct MainGradient_Previews: PreviewProvider {
    static var previews: some View {
        MainGradient(endRadius: 75.0).frame(width: screenWidth, height: screenHeight/5)
    }
}
