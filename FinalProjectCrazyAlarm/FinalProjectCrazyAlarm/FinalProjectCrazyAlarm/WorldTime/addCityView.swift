//
//  addCityView.swift
//  FinalProjectCrazyAlarm
//
//  Created by Ming Xia on 5/3/22.
//

import SwiftUI

struct addCityView: View {
    
    @Environment(\.managedObjectContext) var managedObjContext
    @Environment(\.dismiss) var dismiss
    
    @State private var selectedScope = ""
    @State private var searchQuery = ""
    @State private var currenttime:Date = Date()
    @State var cites: [CityName] = timezoneCityList.partCities

    let timer = Timer.publish(every: 1.0, on: .main, in: .common).autoconnect()

    private var result:[CityName] {
        if searchQuery.isEmpty{
            return cites
        }else{
            return cites.filter{
                $0.city.localizedCaseInsensitiveContains(searchQuery)
            }
        }
    }
    
    
    var body: some View {
        NavigationView{
            Form{
                Section{
                    Picker("City", selection: $selectedScope){
                        SearchBar(text: $searchQuery, placeholder: "Search Cities")
                        ForEach(result, id: \.id){city in
                            Text(city.city + ", "+city.country)
                                .tag(city.city)
                                .font(.system(size:20))
                            
                        }
                    }
                }
                
                Section{
                    HStack{
                        Spacer()
                        Button("Submit"){
                            CitytimeController().addNewCity(name: selectedScope, time: currenttime, country: " ", context: managedObjContext)
                            dismiss()
                        }
                        Spacer()
                    }
                 }
            }
            .onReceive(timer){time in
                currenttime = time
            }
            .listStyle(.plain)
            .navigationTitle("Choose the City")
        }
    }
}

struct addCityView_Previews: PreviewProvider {
    static var previews: some View {
        addCityView()
    }
}
