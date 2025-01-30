//
//  Citytime.swift
//  FinalProjectCrazyAlarm
//
//  Created by Ming Xia on 5/3/22.
//

import Foundation
import CoreData


class CitytimeController: ObservableObject {
    
    static let shared = CitytimeController()

    let container: NSPersistentContainer
    
    init(){
        container = NSPersistentContainer(name: "Citytime")
        
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
    
    func addNewCity(name: String, time: Date, country: String, context: NSManagedObjectContext){
        
        let citynames = Citytime(context: context)
        citynames.id = UUID()
        citynames.name = name
        citynames.time = time
        citynames.country = country
        
        save(context: context)
    }
    
    func editCity(name: String, time: Date, country: String, context: NSManagedObjectContext){
        
        let citynames = Citytime(context: context)
        citynames.name = name
        citynames.time = time
        citynames.country = country
        
        save(context: context)
    }
    
}
