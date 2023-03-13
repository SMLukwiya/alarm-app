
import SwiftUI

struct CustomButton: View {
    let text: LocalizedStringKey
    
    var body: some View {
        Text(text)
            .foregroundColor(black)
            .fontWeight(.semibold)
            .padding()
            .frame(maxWidth: .infinity)
            .background(MainGradient(endRadius: 40, scaleX: 3.0).cornerRadius(30))
    }
}

struct CustomButton_Previews: PreviewProvider {
    static var previews: some View {
        CustomButton(text: "add alarm")
    }
}
