
import SwiftUI

struct EnableNotifications: View {
    var body: some View {
        ZStack {
            CoolSplashScreenComponent()
            VStack {
                Spacer()    
                CustomText(text: LocalizedStringKey("Enable notifications please"), size: 48)
                    .multilineTextAlignment(.center)
                
                Spacer()
                
                Button(action: {
                    
                }, label: {
                    CustomButton(text: LocalizedStringKey("Enable")).padding()  
                })
            }
        }
    }
}

struct EnableNotifications_Previews: PreviewProvider {
    static var previews: some View {
        EnableNotifications()
    }
}
