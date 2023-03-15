
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
                   //end: Date(),
                   end: addTimeToDate(date: Date(), hours: 12, minutes: 0),
                   activity: activities[0],
                   colorIndex: 0
        )
    }
    
    static func DummyAlarmData() -> [AlarmModel] {
        [
            AlarmModel(title: "Activity",
                       body: "Seek and you shall find",
                       repeats: false,
                       sound: .wake_up,
                       alarmEnabled: true,
                       start: Date(),
                       end: addTimeToDate(date: Date(), hours: 4, minutes: 30),
                       activity: "moon.zzz.fill",
                       colorIndex: 1
            )
        ].sorted(by: {$0.endTime < $1.endTime})
    }
}
