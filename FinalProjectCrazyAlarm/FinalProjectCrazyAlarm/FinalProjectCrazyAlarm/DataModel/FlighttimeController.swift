//
//  FlighttimeController.swift
//  FinalProjectCrazyAlarm
//
//  Created by Ming Xia on 5/3/22.
//

import Foundation
import CoreData

class FlighttimeController: ObservableObject {
    
    static let shared = FlighttimeController()

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
    
    func addNewFlight(arrivetime:Date, deptime:Date, arrivecity:String,
                      departcity:String, flightnumber:String, gate:String,
                      terminal:String, status:String, depairport:String, arriveairport:String, context: NSManagedObjectContext){
        
        let flight = Flighttime(context: context)
        flight.id = UUID()
        flight.arrivetime = arrivetime
        flight.deptime = deptime
        flight.arrivecity = arrivecity
        flight.departcity = departcity
        flight.flightnumber = flightnumber
        flight.gate = gate
        flight.terminal = terminal
        flight.status = status
        flight.depairport = depairport
        flight.arriveairport = arriveairport

        
        save(context: context)
    }
    
    func editFlight(arrivetime:Date, deptime:Date, arrivecity:String,
                    departcity:String, flightnumber:String, gate:String,
                    terminal:String, status:String, depairport:String, arriveairport:String, context: NSManagedObjectContext){
        
        let flight = Flighttime(context: context)
        flight.arrivetime = arrivetime
        flight.deptime = deptime
        flight.arrivecity = arrivecity
        flight.departcity = departcity
        flight.flightnumber = flightnumber
        flight.gate = gate
        flight.terminal = terminal
        flight.status = status
        flight.depairport = depairport
        flight.arriveairport = arriveairport
        
        save(context: context)
    }
    
    

}
