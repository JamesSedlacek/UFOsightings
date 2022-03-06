//
//  DateFormatting.swift
//
//  Created by James Sedlacek on 12/5/21.
//

import Foundation

struct DateFormatting {
    
    // Milliseconds after 1970
    static func getDate(from val: Double) -> String {
        let date = Date(timeIntervalSince1970: TimeInterval(val / 1000))
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        dateFormatter.dateFormat = "MMMM dd, yyyy"
        return dateFormatter.string(from: date)
    }
    
    // Milliseconds after 1970
    static func getTime(from val: Double) -> String {
        let date = Date(timeIntervalSince1970: TimeInterval(val / 1000))
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        dateFormatter.dateFormat = "hh:mma"
        dateFormatter.amSymbol = "AM"
        dateFormatter.pmSymbol = "PM"
        return dateFormatter.string(from: date)
    }
    
    static func getCurrentDateTime() -> Int {
        return Int(Date().timeIntervalSince1970 * 1000)
    }
}
