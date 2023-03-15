//
//  AlarmAppApp.swift
//  AlarmApp
//
//  Created by m1 on 12/03/2023.
//

import SwiftUI

@main
struct AlarmApp: App {
    @StateObject var lnManager: LocalNotificationsManager = LocalNotificationsManager()
    
    var body: some Scene {
        WindowGroup {
            SplashScreen().environmentObject(lnManager)
        }
    }
}
