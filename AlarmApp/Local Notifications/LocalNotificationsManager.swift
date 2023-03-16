
import Foundation
import NotificationCenter

@MainActor
class LocalNotificationsManager: NSObject, ObservableObject, UNUserNotificationCenterDelegate {
    let notificationCenter = UNUserNotificationCenter.current()
    @Published var isAuthorized = false
    
    // Store list of notifications/alarms
    @Published var pendingAlarms: [UNNotificationRequest] = []
    
    // view model for AlarmModel
    @Published var alarmModels: [AlarmModel] = [] {
        didSet {
            saveItems()
        }
    }
    
    let itemKey = "Alarm List"
    
    func requestAuthorization() async throws {
        try await notificationCenter.requestAuthorization(options: [
            .sound, .alert
        ])
        
        await getCurrentSettings()
    }
    
    func getCurrentSettings() async {
        let currentSettings = await notificationCenter.notificationSettings()
        
        isAuthorized = currentSettings.authorizationStatus == .authorized ? true : false
    }
    
    func openSettings() {
        if let url = URL(string: UIApplication.openSettingsURLString) {
            if UIApplication.shared.canOpenURL(url) {
                Task {
                    await UIApplication.shared.open(url)
                }
            }
        }
    }
    
    func saveItems() {
        // save state for alarm models
        if let encodeData = try? JSONEncoder().encode(alarmModels) {
            UserDefaults.standard.set(encodeData, forKey: itemKey)
        }
    }
    
    override init() {
        super.init()
        // TODO: Alarm should be able to fire when app is active
        
        // alarmmodels persistence
        guard let data = UserDefaults.standard.data(forKey: itemKey),
              let savedItems = try? JSONDecoder().decode([AlarmModel].self, from: data) else {
            return
        }
        
        self.alarmModels = savedItems
    }
    
    func getPendingAlarms() async {
        pendingAlarms = await notificationCenter.pendingNotificationRequests()
    }
    
    func schedule(localNotification: AlarmModel) async {
        let content = UNMutableNotificationContent()
        content.body = NSLocalizedString(localNotification.body, comment: "")
        content.sound = customSound(soundName: localNotification.sound)
        
        let dateCompponents = localNotification.endDateComponents
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateCompponents, repeats: localNotification.repeats)
        let request = UNNotificationRequest(identifier: localNotification.id, content: content, trigger: trigger)
        
        //Add request
        try? await notificationCenter.add(request)
        pendingAlarms = await notificationCenter.pendingNotificationRequests()
    }
    
    func customSound(soundName: Sounds, fileExt: String = "") -> UNNotificationSound? {
        let fileName = fileExt.isEmpty ? "\(soundName.rawValue)" : "\(soundName.rawValue).\(fileExt)"
        
        return UNNotificationSound(named: UNNotificationSoundName(rawValue: fileName))
    }
    
    func removeRequest(id: String) {
        notificationCenter.removeDeliveredNotifications(withIdentifiers: [id])
        
        //remove from pending alarms as well
        if let index = pendingAlarms.firstIndex(where: {$0.identifier == id}) {
            pendingAlarms.remove(at: index)
        }
    }
    
    func safeAppend(localNotification: AlarmModel) {
        // check if alarm already exist
        if let index =  alarmModels.firstIndex(where: {$0.id == localNotification.id}) {
            // Just update the alarm
            alarmModels[index] = localNotification
        } else {
            alarmModels.append(localNotification)
        }
        
        // Sort alarmModels using end time
        alarmModels = alarmModels.sorted(by: {$0.endTime < $1.endTime})
    }
}
