
import SwiftUI

struct SelectActivity: View {
    @Binding var currentColorIndex: Int
    @Binding var currentActivity: String
    
    var currentColor: Color {
        mainColors[currentColorIndex]
    }
    
    var nextIndex: Int {
        (currentColorIndex + 1) % mainColors.count
    }
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(activities, id: \.self) { activity in
                    let selectedActivity = activity == currentActivity
                    
                    Image(systemName: activity)
                        .font(selectedActivity ? .title : .subheadline)
                        .foregroundColor(selectedActivity ? currentColor : lightBlue)
                        .onTapGesture {
                            withAnimation {
                                currentActivity = activity
                            }
                        }
                }
            }
        }
    }
}

struct SelectActivity_Previews: PreviewProvider {
    static var previews: some View {
        SelectActivity(currentColorIndex: .constant(0), currentActivity: .constant(activities[0]))
            .padding()
    }
}
