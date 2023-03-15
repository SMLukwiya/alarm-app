
import SwiftUI

struct GrayedText: View {
    let text: LocalizedStringKey
    var font: Font = .headline
    var body: some View {
        Text(text)
            .foregroundColor(lightGray)
            .font(font)
    }
}

struct GrayedText_Previews: PreviewProvider {
    static var previews: some View {
        GrayedText(text: "Time is what we want most but what we use worst. Get up and Inspire", font: .title)
    }
}
