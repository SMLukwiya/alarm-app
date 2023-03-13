    
import SwiftUI

struct AboutView: View {
    var body: some View {
        ZStack {    
            LinearGradient(colors: [.yellow, black], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            VStack {
                VStack {
                    CustomText(text: LocalizedStringKey("About"), size: 48)
                    CustomText(text: "Time is what we want most but what we use worst. Get up and Inspire", size: 24)
                }
                .multilineTextAlignment(.leading)
                .minimumScaleFactor(0.1)
                .padding()
                
                Spacer()
                
                Image(aboutClock)
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(10)
                    .frame(width: screenWidth * 0.8)
                
                Spacer()
                
                if let url = URL(string: "https://clockify.me/blog/fun/quotes-about-time-management/") {
                    Link(destination: url, label: {
                        CustomButton(text: "to Inspiration Page").padding()
                    })
                }
            }
        }
    }
}

struct About_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}
    
