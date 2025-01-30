//
//  addFlightTime.swift
//  FinalProjectCrazyAlarm
//
//  Created by Ming Xia on 5/3/22.
//

import SwiftUI

struct addFlightTime: View {
    
    @Environment(\.managedObjectContext) var managedObjContext
    @Environment(\.dismiss) var dismiss
    
    
    @State private var arrivecity = ""
    @State private var departcity = ""
    @State private var flightnumber = ""
    @State private var gate = ""
    @State private var terminal = ""
    @State private var status = ""
    @State private var depairport = ""
    @State private var arriveairport = ""
    @State private var arrivetime: Date = Date.now
    @State private var deptime : Date = Date.now
    
    
//arrivetime:Date, deptime:Date,
    
    var body: some View {
        VStack{
            Form{
                Section{
                    TextField("Depart City", text: $departcity)
                    TextField("Arrive City", text: $arrivecity)
                    TextField("Flight Number", text: $flightnumber)
                    TextField("Gate", text: $gate)
                    TextField("Terminal", text: $terminal)
                    TextField("Status", text: $status)
                    TextField("Depart Airport", text: $depairport)
                    TextField("Arrive Airport", text: $arriveairport)
                    DatePicker("Depart Time", selection: $deptime, in: Date()...)
                    DatePicker("Arrive Time", selection: $arrivetime, in: Date()...)
                }
                
                Section{
                    HStack{
                        Spacer()
                        Button("Submit"){
                            FlighttimeController().addNewFlight(arrivetime: arrivetime, deptime: deptime, arrivecity: arrivecity, departcity: departcity, flightnumber: flightnumber, gate: gate, terminal: terminal, status: status, depairport:depairport, arriveairport:arriveairport, context: managedObjContext)
                            dismiss()
                        }
                        Spacer()
                    }
                }
            }
        }
    }
}

struct addFlightTime_Previews: PreviewProvider {
    static var previews: some View {
        addFlightTime()
    }
}
