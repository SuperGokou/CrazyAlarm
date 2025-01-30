//
//  addAlarmView.swift
//  FinalProjectCrazyAlarm
//
//  Created by Ming Xia on 5/3/22.
//

import SwiftUI

struct addAlarmView: View {
    
    
    @Environment(\.managedObjectContext) var managedObjContext
    @Environment(\.dismiss) var dismiss
    
    @State private var selectedScope = Date.now
    
    
    var body: some View {
        NavigationView{
            Form{
                Section{
                    DatePicker("AlarmTime", selection: $selectedScope, displayedComponents: .hourAndMinute)
                    }
                Section{
                    HStack{
                        Spacer()
                        Button("Submit"){
                            AlarmTimeController().addNewAlarm(time:selectedScope, enable: false, context: managedObjContext)
                            dismiss()
                        }
                        Spacer()
                    }
                }

                }
            
        }
            .listStyle(.plain)
            .navigationTitle("Choose the City")
    }
}

struct addAlarmView_Previews: PreviewProvider {
    static var previews: some View {
        addAlarmView()
    }
}
