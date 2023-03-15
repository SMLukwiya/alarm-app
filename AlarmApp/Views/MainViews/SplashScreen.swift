
import SwiftUI

struct SplashScreen: View {
    @State private var isActive = false
    @State private var opacity = 0.3
    @State private var fontSize = 12.0
    
    var body: some View {
        if isActive {
            MainAlarmView()
        } else {
            ZStack {
                CoolSplashScreenComponent(color1: blue, color2: .clear)
                VStack {
                    VStack(alignment: .leading, spacing: 0) {
                        CustomText(text: LocalizedStringKey("hello there!"), size: fontSize)
                        CustomText(text: LocalizedStringKey("let's add an alarm"), size: fontSize)
                    }
                    .multilineTextAlignment(.leading)
                    .padding()
                    .onAppear {
                        withAnimation(.easeIn(duration: 2.5)) {
                            opacity = 1.0
                            fontSize = 36.0
                        }
                    }
                    
                    Spacer()
                    
                    Image(welcome).resizable().scaledToFit()
                    Spacer()
                }
            }
            .opacity(opacity)
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    withAnimation { isActive = true }   
                }
            }
        }
    }
}

struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen().environmentObject(LocalNotificationsManager()    )
    }
}
