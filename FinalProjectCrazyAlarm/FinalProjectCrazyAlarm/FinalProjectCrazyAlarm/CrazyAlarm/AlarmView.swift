//
//  AlarmView.swift
//  FinalProjectCrazyAlarm
//
//  Created by Ming Xia on 5/3/22.
//
import SwiftUI
import AVFoundation

struct AlarmView: View {
    @State private var buttonisOn = false
    @State private var gamebuttonisOn = false
    @State private var musicuttonisOn = false
    @State private var stopbutton = true

    
    @State private var currentTime: Date = Date.now

    
    @State var addbuttoShow: Bool = false
    @State var player: AVAudioPlayer!
    
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(sortDescriptors: [SortDescriptor(\.time)]) var alarms: FetchedResults <Alarm>
    
    var dateformatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        return formatter
    }
    
    let timer = Timer.publish(every: 1.0, on: .main, in: .common).autoconnect()

    var body: some View {

        NavigationView{
            ZStack{
                Color.yellow
                    .opacity(0.6)
                    .ignoresSafeArea()
                VStack(alignment: .center){
                    Spacer()
                    List{
                        Section(header: Text("😴Sleep  |  😃Wake up").font(.headline).foregroundColor(.gray)){
                            ForEach(alarms, id: \.id){alarm in
                                let alarmtime = Calendar.current.date(byAdding: .second, value: Int(alarm.time!.timeIntervalSinceNow), to: Date()) ?? Date()
                                HStack{
                                    VStack(alignment: .leading){
                                        let temptime = dateformatter.string(from: alarm.time!)
                                        let words = temptime.components(separatedBy: " ")
                                        HStack(alignment: .lastTextBaseline, spacing: -1){
                                            Text(words[0] + " ")
                                                .font(.system(size:40))
                                            Text(words[1])
                                        }
                                        Text("Alarm")
                                            .font(.system(size: 15))
                                    }
                                    Toggle("",isOn: Binding<Bool>(
                                        
                                            get: { alarm.enable },
                                            set: {_ in
                                                alarm.enable = !alarm.enable
                                                if(alarm.enable){
                                                    stopbutton = !stopbutton
                                                }else{
                                                    self.player.stop()
                                                }
                                                }
                                    ))
                                    .onReceive(timer){time in
                                        stopbutton = updateTime(FutureTime: alarmtime)
                                        if (stopbutton){
                                            self.player.play()
                                            self.timer.upstream.connect().cancel()
                                        }
                                    }
                                           
                                }.padding()
                            }
                            .onDelete(perform: deleteAlarm)
                        }
                        .navigationTitle("⏰ CrazyAlarm")
                    }
                    .onAppear {
                        UITableView.appearance().backgroundColor = .clear
                        var music : String {
                            var mu = "alarmmusic"
                            if(musicuttonisOn){
                                mu = "crazymusic"
                            }
                            return mu
                        }
                        let url = Bundle.main.url(forResource: music, withExtension: "mp3")
                        self.player = try! AVAudioPlayer(contentsOf: url!)
                        self.player.prepareToPlay()
                    }
                    .foregroundColor(Color.black)
                    .font(.system(size: 20).bold())
                    Spacer()
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
                        addAlarmView()
                    }
                }
            }
            .navigationViewStyle(.stack)
        }
    }
    
    private func deleteAlarm(at offsets: IndexSet){
        withAnimation{
            offsets.map{_ in alarms[0]}.forEach(managedObjectContext.delete)
            AlarmTimeController().save(context: managedObjectContext)
        }
    }
    
    
    private func updateTime(FutureTime: Date) -> Bool{
        
        let remaining = Calendar.current.dateComponents([.second], from: Date(), to: FutureTime)
        
        let second = remaining.second ?? 0
        if (Int(second) == 0){
            return true
        }
        return false
    }

}

struct AlarmView_Previews: PreviewProvider {
    static var previews: some View {
        AlarmView()
    }
}


