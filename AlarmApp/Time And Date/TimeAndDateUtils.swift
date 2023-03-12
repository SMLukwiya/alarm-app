
import Foundation

func dateToPercent(date: Date) -> CGFloat {
    let result = getTimeComponents(date: date)
    
    return (CGFloat(result.hour) / 24) + (CGFloat(result.minute) / (60 * 24))
}

func getTimeComponents(date: Date) -> (minute: Int, hour: Int, day: Int, month: Int, year: Int) {
    let components = Calendar.current.dateComponents([.minute, .hour, .day, .month, .year], from: date)
    
    let minute = components.minute ?? 0
    let hour = components.hour ?? 0
    let day = components.day ?? 0
    let month = components.month ?? 0
    let year = components.year ?? 0
    
    return (minute: minute, hour: hour, day: day, month: month, year: year)
}

func getTimeFromDate(date: Date) -> String {
    let component = getTimeComponents(date: date)
    
    let hour = component.hour
    let minute = component.minute
    
    let time =  String(format: "%02d:%02d", hour, minute)
    return time
}

func addTimeToDate(date: Date, hours: Int, minutes: Int) -> Date {
    date.addingTimeInterval(TimeInterval(hours * 3600 + minutes * 60))
}
