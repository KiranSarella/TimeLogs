//
//  Persistance.swift
//  TimeLogs
//
//  Created by Kiran on 05/04/21.
//

import Foundation


class Persistance {
    
    static let shared = Persistance()
    
    
    func saveLogs(_ logs: [DayLog]) {
        
        try? UserDefaults.standard.set(PropertyListEncoder().encode(logs),
                                       forKey:"logs")
    }
    
    func getLogs() -> [DayLog]? {
        
        guard
            let data = UserDefaults.standard.object(forKey:"logs") as? Data,
            let logs = try? PropertyListDecoder().decode([DayLog].self, from: data)
        else {
            return nil
        }
        
        return logs
        
    }
}
