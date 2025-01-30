//
//  ContentView.swift
//  FinalProjectCrazyAlarm
//
//  Created by Ming Xia on 5/3/22.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(sortDescriptors: [SortDescriptor(\.departcity, order: .reverse)]) var flights: FetchedResults <Flighttime>
    
    
    var flightnum :Int {
        var num = 0
        num = flights.count
        return num
    }
    
    var body: some View {
        
        TabView{
            
            AlarmView()
                .tabItem{
                    Image(systemName: "alarm")
                    Text("Alarm")
                }
            mainWorldTime()
                .tabItem{
                    Image(systemName: "globe.europe.africa.fill")
                    Text("World")
                }
//            AlarmGameView()
//                .tabItem{
//                    Image(systemName: "gamecontroller")
//                    Text("Game")
//                }
            FlightTimeView()
                .tabItem{
                    Image(systemName: "airplane.departure")
                    Text("Flight")
                }
                .badge(flightnum)
        }
        .onAppear(){
            UITabBar.appearance().backgroundColor = .systemYellow
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
