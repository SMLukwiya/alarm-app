
import Foundation
import SwiftUI

struct AlarmModel: Identifiable {
    let id = UUID().uuidString
    
    let title: String
    let body: String
    let repeats: Bool
    var sound: Sounds
    var alarmEnabled: Bool
    var start: Date
    var end: Date
    
    var startTime: TimeModel {
        dateToTimeModel(date: start)
    }
    
    var endTime: TimeModel {
        dateToTimeModel(date: end)
    }
    
    var timeInterval: TimeInterval {
        end -   start
    }
    
    var activity: String
    var colorIndex: Int
    var activityColor: Color {
        gradientColors[colorIndex]
    }
    
    static func DefaultAlarm() -> AlarmModel {
        AlarmModel(title: "Activity",
                   body: "Seek and you shall find",
                   repeats: false,
                   sound: .wake_up,
                   alarmEnabled: false,
                   start: Date(),
                   end: Date(),
                   activity: activities[0],
                   colorIndex: 0
        )
    }
}
