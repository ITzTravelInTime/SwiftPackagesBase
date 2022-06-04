/*
 A Swift Library containing useful utilities code for Any Swift project.
 Copyright (C) 2022 Pietro Caruso

 This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation; either version 2.1 of the License, or (at your option) any later version.

 This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.

 You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
 */

import Foundation

public extension Date{
    ///Returns `String` values for Year, Month, Day, Hour, Minute, Second and Nanosecond for the current `Date` instance using the Georgian calendar
    @available(iOS 8.0, *)
    func getTimeStrings() -> [Calendar.Component: String]{
        let now = self
        let calendar = Calendar.init(identifier: .gregorian)
        
        var timeItems: [Calendar.Component: String]  = [
            .year:  "\(calendar.component(.year, from: now))",    //0 YEAR
            .month: "\(calendar.component(.month, from: now))",   //1 MONTH
            .day:   "\(calendar.component(.day, from: now))",     //2 DAY
            .hour:  "\(calendar.component(.hour, from: now))",    //3 HOUR
            .minute:"\(calendar.component(.minute, from: now))",  //4 MINUTE
            .second:"\(calendar.component(.second, from: now))",  //5 SECOND
            .nanosecond: "\(calendar.component(.nanosecond, from: now))" //6 NANOSECOND
        ]
        
        for i in timeItems{
            if i.value.count == 1{
                timeItems[i.key] = "0" + i.value
            }
        }
        
        return timeItems
    }
    
    ///Returns a `String` containing the hour of the current `Date` instance using the Georgian calendar
    @available(iOS 8.0, *)
    func getHourString(includingSeconds: Bool = false) -> String{
        let timeItems = getTimeStrings()
    
        return "\(timeItems[.hour]!):\(timeItems[.minute]!)" + (includingSeconds ? ":\(timeItems[.second]!)" : "")
    }
    
    ///Returns a string with the date of the current `Date` instance using the Georgian calendae
    @available(iOS 8.0, *)
    func getDateString() -> String{
        let timeItems = getTimeStrings()
    
        return "\(timeItems[.month]!)/\(timeItems[.day]!)/\(timeItems[.year]!)"
    }
    
    ///Returns a `String` representing the date and hour of the current `Date` instance using the Georgian calendar
    @available(iOS 8.0, *)
    func getTimeString(includingSeconds: Bool = false) -> String{
        return getDateString() + " " + getHourString(includingSeconds: includingSeconds)
    }

    static func - (lhs: Date, rhs: Date) -> TimeInterval {
        return lhs.timeIntervalSinceReferenceDate - rhs.timeIntervalSinceReferenceDate
    }

}
