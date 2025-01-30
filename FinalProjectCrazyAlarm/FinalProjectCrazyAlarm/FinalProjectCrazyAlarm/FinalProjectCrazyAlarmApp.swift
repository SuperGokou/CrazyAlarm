//
//  FinalProjectCrazyAlarmApp.swift
//  FinalProjectCrazyAlarm
//
//  Created by Ming Xia on 5/3/22.
//

import SwiftUI

@main
struct FinalProjectCrazyAlarmApp: App {
    let citytimeController = CitytimeController.shared
    let alarmTimeController = AlarmTimeController.shared
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, citytimeController.container.viewContext)
                .environment(\.managedObjectContext, alarmTimeController.container.viewContext)


        }
    }
}
