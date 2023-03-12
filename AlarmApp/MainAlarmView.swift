//
//  ContentView.swift
//  AlarmApp
//
//  Created by m1 on 12/03/2023.
//

import SwiftUI

struct MainAlarmView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, Alarm!")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainAlarmView()
    }
}
