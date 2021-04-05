//
//  Business.swift
//  TimeLogs
//
//  Created by Kiran on 01/04/21.
//

import Foundation
import SwiftUI

class TimeLogsBusiness: ObservableObject {
    
    @Published var dayLogs = [DayLog]()
    
    
    init() {
        
        if let logs = Persistance.shared.getLogs() {
            dayLogs = logs
        }
        
    }
    
    func addTimeLog(_ log: String) {
        
        let date = Date()
        
        let timeLog = TimeLog(time: date.getOnlyTime(), task: log)
        
        let onlyDate = Date().getOnlyDate()
        
        // get today logs
        let todayLog = dayLogs.first { (dayLog) -> Bool in
            if dayLog.date == onlyDate {
                return true
            } else {
                return false
            }
        }
        
        if let todayLog = todayLog {
            // append
            todayLog.timeLogs.append(timeLog)
            objectWillChange.send()
        } else {
            // create new
            let todayTimeLog = DayLog(date: onlyDate, timeLogs: [timeLog])
            dayLogs.insert(todayTimeLog, at: 0)
        }
        
        Persistance.shared.saveLogs(dayLogs)
    }
    
    
    func removeLogsSection(_ logsSection: DayLog) {
        
        guard let index = dayLogs.firstIndex(where: { $0.id == logsSection.id }) else {
            return
        }
        
        // remove the day log
        dayLogs.remove(at: index)
        
        // update persistance
        Persistance.shared.saveLogs(dayLogs)
    }
 
}
