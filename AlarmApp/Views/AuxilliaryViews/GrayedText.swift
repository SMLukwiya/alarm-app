
import SwiftUI

struct GrayedText: View {
    let text: LocalizedStringKey
    var font: Font = .headline
    var body: some View {
        Text(text)
            .foregroundColor(.gray)
            .font(font)
    }
}

struct GrayedText_Previews: PreviewProvider {
    static var previews: some View {
        GrayedText(text: "Alarm App inspired by the need to secure the bag")
    }
}
