//
//  Timelog.swift
//  TimeLogs
//
//  Created by Kiran on 01/04/21.
//

import Foundation
import SwiftUI




class TimeLog: Identifiable, Codable {
    var id: UUID = UUID()
    var time: String = ""    // HH:mm:ss
    var task: String = ""
    
    init(time: String, task: String) {
        self.time = time
        self.task = task
    }
    
   
    
    func getTimeFormatted() -> String {
        
        // convert string to date object
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        let yourDate: Date? = formatter.date(from: time)
        // convert date object to required string format
        formatter.dateFormat = "h:mm a"
        let updatedString = formatter.string(from: yourDate!)
        return updatedString
    }
}




class DayLog: Identifiable, Codable {
    var id = UUID()
    var date: String     // yyyy-MM-dd
    var timeLogs: [TimeLog]
    
    init(date: String, timeLogs: [TimeLog]) {
        self.date = date
        self.timeLogs = timeLogs
    }
    
    func getHeading() -> String {
        
        // convert string to date object
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        let yourDate: Date? = formatter.date(from: date)
        // convert date object to required string format
        formatter.dateFormat = "MMMM dd"
        let updatedString = formatter.string(from: yourDate!)
        return updatedString
    }
    
}


