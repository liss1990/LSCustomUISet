//
//  NSDate.swift
//  Driver
//
//  Created by 李丝思 on 2018/9/28.
//  Copyright © 2018 李丝思. All rights reserved.
//

import Foundation

extension Date {
    ////本月开始的日期
    static func starOfCurrentMonth() -> Date {
        let date = Date()
        let calendar = NSCalendar.current
        let components = calendar.dateComponents(
            Set<Calendar.Component>([.year, .month]), from: date)
        let startOfMonth = calendar.date(from: components)!
        return startOfMonth
    }
    
    //本月结束日期
   static func endOfCurrentMonth(returnEndTime:Bool = false) -> Date {
        let calendar = NSCalendar.current
        var components = DateComponents()
        components.month = 1
        if returnEndTime {
            components.second = -1
        } else {
            components.day = -1
        }
    
        let endOfMonth =  calendar.date(byAdding: components, to: Date.starOfCurrentMonth())!
        return endOfMonth
    }
    //指定年月的开始日期
    static   func startOfMonth(year: Int, month: Int,isIt15th:Bool = false) -> Date {
        let calendar = NSCalendar.current
        var startComps = DateComponents()
        if isIt15th {
             startComps.day = 16
        }else{
             startComps.day = 1
        }
       
        startComps.month = month
        startComps.year = year
        let startDate = calendar.date(from: startComps)! 
        return startDate
    }
    
    //指定年月的结束日期
    static   func endOfMonth2(year: Int, month: Int) -> Date {
        let calendar = NSCalendar.current
        var startComps = DateComponents()
        startComps.day = 15
        startComps.month = month
        startComps.year = year
        let startDate = calendar.date(from: startComps)!
        return startDate
    }
    
    
    //指定年月的结束日期
  static  func endOfMonth(year: Int, month: Int, returnEndTime:Bool = false) -> Date {
        let calendar = NSCalendar.current
        var components = DateComponents()
        components.month = 1
        if returnEndTime {
            components.second = -1
        } else {
            components.day = -1
        }
        
        let endOfYear = calendar.date(byAdding: components,
                                      to: startOfMonth(year: year, month:month,isIt15th: returnEndTime))!
        return endOfYear
    }

}
