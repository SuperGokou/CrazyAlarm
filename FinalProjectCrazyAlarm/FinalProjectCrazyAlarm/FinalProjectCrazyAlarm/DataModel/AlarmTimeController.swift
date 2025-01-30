//
//  AlarmTimeController.swift
//  FinalProjectCrazyAlarm
//
//  Created by Ming Xia on 5/3/22.
//

import Foundation
import CoreData


class AlarmTimeController: ObservableObject {
    
    static let shared = AlarmTimeController()

    let container: NSPersistentContainer
    
    init(){
        container = NSPersistentContainer(name: "Alarm")
        
        container.loadPersistentStores{ (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolve Error: \(error)")
            }
        }
    }
    
    func save(context: NSManagedObjectContext){
        do{
            try context.save()
            print("Saved !!!")
        }catch{
            print("Failed Saved Data !!")
        }
    }
    
    func addNewAlarm(time: Date,enable: Bool, context: NSManagedObjectContext){
        
        let alarm = Alarm(context: context)
        alarm.id = UUID()
        alarm.time = time
        
        save(context: context)
    }
    
    func editCity(time: Date, enable: Bool, context: NSManagedObjectContext){
        
        let alarm = Alarm(context: context)
        alarm.time = time
        alarm.enable = enable
        
        save(context: context)
    }
    
}
