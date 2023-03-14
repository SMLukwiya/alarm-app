
import SwiftUI

struct YouDidIt: View {
    let prompt: LocalizedStringKey = "you did it! here you can manage your alarm, change time and other things"
    
    var body: some View {
        ZStack {
            MainGradient(endRadius: 120, scaleX: 1.5)
                .cornerRadius(20)
                .frame(height: screenHeight / 4)
                .overlay(
                    HStack {
                        CustomText(text: prompt, size: 18)
                            .multilineTextAlignment(.leading)
                            .frame(width: screenWidth / 1.8)
                            .padding(.horizontal    )
                        Spacer()
                        
                        Image(beachDay).resizable().scaledToFit().opacity(0.85).padding(.horizontal)
                    }
                )
                .padding()
        }
    }
}

struct YouDidIt_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            black.opacity(0.7       ).ignoresSafeArea()
            YouDidIt()
        }
    }
}
