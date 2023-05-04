//
//  Extensions.swift
//  Fundy 2.0
//
//  Created by Mason Foreman on 27/2/2023.
//

import Foundation
import SwiftUI


//Color: An extension to the Color type, adding several custom color properties.
extension Color {
    static let background = Color("Background")
    static let icon = Color("Icon")
    static let text = Color("Text")
    static let button = Color("Button")
    static let systemBackground = Color(uiColor: .systemBackground)
}


//DateFormatter: An extension to the DateFormatter type, adding a static computed property that returns a pre-configured date formatter for a specific format.
extension DateFormatter {
    static let allNumericUSA: DateFormatter = {
        print("initialising DateFormatter")
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd/yyyy"
        
        return formatter
    }()
}


//String: An extension to the String type, adding a method to parse a string into a date using the DateFormatter.allNumericUSA formatter.

extension String {
    func dateParse() -> Date {
        guard let parsedDate = DateFormatter.allNumericUSA.date(from: self) else { return Date() }
        
        return parsedDate
    }
}



//Date: An extension to the Date type, conforming to the Strideable protocol, which provides a method to format a date as a string.
extension Date: Strideable {
    func formatted() -> String {
        return self.formatted(.dateTime.year().month().day())
    }
}


//Double: An extension to the Double type, adding a method to round a double to 2 decimal places.
extension Double {
    func roundedTo2Digits() -> Double {
        return (self * 100).rounded() / 100
    }
}

