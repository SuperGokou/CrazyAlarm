//
//  mainWorldTime.swift
//  FinalProjectCrazyAlarm
//
//  Created by Ming Xia on 5/3/22.
//

import SwiftUI

struct mainWorldTime: View {
    
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(sortDescriptors: [SortDescriptor(\.name)]) var cities: FetchedResults <Citytime>
    
    @State var addbuttoShow: Bool = false
    @State var currentDate: Date = Date()
    
    let timer = Timer.publish(every: 1.0, on: .main, in: .common).autoconnect()
    @State private var zonetime:Date = Date()

    var dateformatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        return formatter
    }

    var body: some View {
        let Swidth = UIScreen.main.bounds.size.width
        NavigationView{
            ZStack{
                Color.yellow
                    .opacity(0.6)
                    .ignoresSafeArea()
                VStack(spacing: -2){
                    Spacer()
                    Form(){
                        List{
                            ForEach(cities, id: \.id){city in
                                HStack(alignment: .lastTextBaseline){
                                    VStack(alignment: .leading, spacing: 1){
                                        Text("Today" + ", +" + "0" + "HRS")
                                            .font(.system(size: 12))
                                            .foregroundColor(.gray)
                                        Text(city.name!)
                                            .font(.system(size: 30))
                                    }
                                    .frame(width: Swidth/2 - 45, height: 60, alignment: .bottomLeading)

                                    Spacer()
                                    HStack(alignment: .lastTextBaseline, spacing: -1){
                                      
                                        let temptime = dateformatter.string(from: currentDate)
                                        let words = temptime.components(separatedBy: " ")
                                        Text(words[0] + " ")
                                            .font(.system(size:45))
                                        Text(words[1])
                                    }
                                    .frame(width: Swidth/2 - 30, height: 60, alignment: .bottomTrailing)
                                    Spacer()
                                }
                                .frame(width: Swidth - 60, height: 90, alignment: .center)
                                .offset(x:-10, y:0)
                            }
                            .onDelete(perform: deleteTime)

                        }
                        
                    }
                }
                .navigationTitle("🗺️ World Clock")
                .onAppear {
                    UITableView.appearance().backgroundColor = .clear
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
                    addCityView()
                }
            }
            .onReceive(timer){time in
                currentDate = time
            }
            .navigationViewStyle(.stack)

        }
    }
    private func deleteTime(offsets: IndexSet){
        withAnimation{
            offsets.map{_ in cities[0]}.forEach(managedObjectContext.delete)
            CitytimeController().save(context: managedObjectContext)
        }
    }
    
//    private func zonecaltime(zone: String, zonetimes: Date) -> Date {
//        if(zone == "UTC-11"){
//            zonetimes = currentDate.addingTimeInterval(-14400)
//        }else if(zone == "UTC-10"){
//            zonetimes = currentDate.addingTimeInterval(-10800)
//        }else if(zone == "UTC-10"){
//            zonetimes = currentDate.addingTimeInterval(-7200)
//        }else{
//            zonetimes = currentDate
//        }
//        return zonetimes
//    }
}

struct mainWorldTime_Previews: PreviewProvider {
    static var previews: some View {
        mainWorldTime()
    }
}
