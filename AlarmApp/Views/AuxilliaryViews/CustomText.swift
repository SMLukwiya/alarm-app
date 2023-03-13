
import SwiftUI

struct CustomText: View {
    let fontName = "WorkSans-VariableFont_wght"
    let text: LocalizedStringKey
    let size: CGFloat
    
    var body: some View {
        Text(text)
            .font(Font.custom(fontName, size: size))
    }
}

struct CustomText_Previews: PreviewProvider {
    static var previews: some View {
        CustomText(text: "Set alarm and\nSecure the bag", size: 36)
    }
}
