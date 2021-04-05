//
//  Extensions.swift
//  TimeLogs
//
//  Created by Kiran on 01/04/21.
//

import Foundation


extension Date {
    
    func getOnlyTime() -> String {
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let myString = formatter.string(from: self)
        let yourDate: Date? = formatter.date(from: myString)
        formatter.dateFormat = "HH:mm"
        let updatedString = formatter.string(from: yourDate!)
        
        return updatedString
    }
    

    
    func getOnlyDate() -> String {
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let myString = formatter.string(from: self)
        let yourDate: Date? = formatter.date(from: myString)
        formatter.dateFormat = "yyyy-MM-dd"
        let updatedString = formatter.string(from: yourDate!)
        
        return updatedString
    }
    
}
