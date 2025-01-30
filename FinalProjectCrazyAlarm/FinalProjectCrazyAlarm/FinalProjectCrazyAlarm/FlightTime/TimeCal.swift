//
//  FlightUrlData.swift
//  FinalProjectCrazyAlarm
//
//  Created by Ming Xia on 5/4/22.
//

import Foundation

func TimeCal(date: Date) ->String {
    
    let mins = Int(date.timeIntervalSinceNow)/60
    let hours = mins/60
    let days = hours/24
    
    if (days >= 1 && days < 2) {
        return "Tomorrow"
    }else if(days >= 2 ){
        return "In \(days) days"
    }else{
        return "In \(hours) hours"
    }
}
