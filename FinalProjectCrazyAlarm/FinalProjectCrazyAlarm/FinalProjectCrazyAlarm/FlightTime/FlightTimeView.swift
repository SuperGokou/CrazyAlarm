//
//  FlightTimeView.swift
//  FinalProjectCrazyAlarm
//
//  Created by Ming Xia on 5/3/22.
//

import SwiftUI

struct FlightTimeView: View {

    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(sortDescriptors: [SortDescriptor(\.deptime)]) var flights: FetchedResults <Flighttime>
    
    @State var nowStatus = "Now"
    @State var CheckinStatus = "Check-in"

    @State var addbuttoShow: Bool = false
    
    var dateformatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        return formatter
    }
    
    var body: some View {
        NavigationView{
            ZStack{
                Color.yellow
                    .opacity(0.6)
                    .ignoresSafeArea()
                VStack{
                    Spacer()
                    Form(){
                        ForEach(flights, id: \.id){flight in
                            let temptime = dateformatter.string(from: flight.deptime!)
                            let words = temptime.components(separatedBy: " ")
                            let temptime1 = dateformatter.string(from: flight.arrivetime!)
                            let words1 = temptime1.components(separatedBy: " ")
                        Section(header: HStack{
                            let dataTime = TimeCal(date: flight.deptime!)
                            Text(dataTime)
                                .offset(x: -20, y:0)
                            Spacer()
                            Text(words[0])
                                .offset(x: 20, y:0)
                        }.font(.system(size: 15).bold())){
                            VStack{
                                Spacer()
                                HStack(spacing:15){
                                    VStack(alignment:.leading){
                                        Text("🇺🇸" + flight.departcity!)
                                        
                                        HStack(alignment: .firstTextBaseline){
                                            Text(flight.depairport!)
                                                .font(.system(size: 30))
                                            Text(words[0])
                                                .font(.headline)
                                            Text(words[1])
                                                .font(.system(size: 15))
                                        }
                                    }
                                    Spacer()
                                    VStack(alignment:.trailing){
                                        Text("🇺🇸" + flight.arrivecity!)
                                        HStack(alignment: .lastTextBaseline){
                                            Text(words1[0])
                                                .font(.headline)
                                            Text(words1[1])
                                                .font(.system(size: 15))
                                            Text(flight.arriveairport!)
                                                .font(.system(size: 30))
                                        }
                                    }
                                }
                                Spacer()
                                Spacer()
                                Spacer()
                                HStack(spacing:30){
                                    VStack(alignment:.leading){
                                        Text("Flight")
                                        Text(flight.flightnumber!)
                                    }
                                    VStack(alignment:.leading){
                                        Text("Status")
                                        Text(flight.status!)
                                    }
                                    VStack(alignment:.center){
                                        Text("Terminal")
                                        HStack{
                                            Text(Image(systemName: "airplane.departure"))
                                            Text(flight.terminal!)
                                        }
                                    }
                                    VStack(alignment:.center){
                                        Text("Gate")
                                        Text(flight.gate!)
                                    }
                                    
                                    Spacer()
                                }.font(.system(size: 15))

                                Divider()
                                    .background(Color.blue)

                                HStack{
                                    let boardtime = flight.deptime!.addingTimeInterval(-1800)
                                    let temptime2 = dateformatter.string(from: boardtime)
                                    let words2 = temptime2.components(separatedBy: " ")
                                    let bftime = Int(flight.deptime!.timeIntervalSinceNow)/3600
                                    if (bftime <= 24){
                                        VStack(alignment: .leading){
                                            Text(nowStatus)
                                                .font(.system(size: 12).bold())
                                                .foregroundColor(.gray)
                                            Text(CheckinStatus)
                                                .font(.headline)
                                        }
                                        Spacer()
                                        VStack(alignment: .trailing){
                                            
                                            Text("Ends in " + words2[0])
                                                .font(.system(size: 12).bold())
                                                .foregroundColor(.gray)
                                            Text(String(bftime))
                                                .font(.headline)
                                        }
                                    }else{
                                        VStack(alignment: .leading){
                                            Text("Now")
                                                .font(.system(size: 12).bold())
                                                .foregroundColor(.gray)
                                            Text("Not Avaiable")
                                                .font(.headline)
                                        }
                                        Spacer()
                                        VStack(alignment: .trailing){
                                            Text("Check in")
                                                .font(.system(size: 12).bold())
                                                .foregroundColor(.gray)
                                            Text(String(bftime/24)+" days")
                                                .font(.headline)
                                        }
                                    }
                                }
                                
                            }
                        }
                    }
                        .onDelete(perform: deleteFlight)
                    }
                    
                }
                .navigationTitle("✈️ Flight Time")
            }
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing){
                    Button(action: {
                        addbuttoShow.toggle()
                        
                    }) {
                        Text(Image(systemName: "plus")).font(.system(size: 20).bold())
                    }
                }
                ToolbarItem(placement: .navigationBarLeading){
                    EditButton()
                        .font(.system(size: 22).bold())
                }
            }
            .sheet(isPresented: $addbuttoShow){
                addFlightTime()
            }
        }
        .navigationViewStyle(.stack)
    }
    
    private func deleteFlight(offsets: IndexSet){
        withAnimation{
            offsets.map{_ in flights[0]}.forEach(managedObjectContext.delete)
            FlighttimeController().save(context: managedObjectContext)
        }
    }
}

struct FlightTimeView_Previews: PreviewProvider {
    static var previews: some View {
        FlightTimeView()
    }
}
