
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
}