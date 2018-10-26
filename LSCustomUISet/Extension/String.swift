//
//  StringExtension.swift
//  SlideMenuControllerSwift
//
//  Created by Yuji Hato on 1/22/15.
//  Copyright (c) 2015 Yuji Hato. All rights reserved.
//

import Foundation

extension String {
    static func className(_ aClass: AnyClass) -> String {
        return NSStringFromClass(aClass).components(separatedBy: ".").last!
    }
    func substring(_ from: Int) -> String {
        return self.substring(from: self.characters.index(self.startIndex, offsetBy: from))
    }
    /// 时间转换
    ///
    /// - Parameters:
    ///   - timeStamp: <#timeStamp description#>
    ///   - formatter: <#formatter description#>
    /// - Returns: <#return value description#>
   static func myTimeInterval(timeStamp:String,formatter:String) -> String {
        //转换为时间
        let timeInterval:TimeInterval = TimeInterval(timeStamp)!
        let date = Date(timeIntervalSince1970: timeInterval)
        //格式话输出
        let dformatter = DateFormatter()
        dformatter.dateFormat = formatter
        return dformatter.string(from: date)
    }
  
    
    /// date -> string
    ///
    static func timeDateToString(date:Date,formatterString:String) -> String {
        
        let formatter = DateFormatter()
        formatter.dateFormat = formatterString
        let date = formatter.string(from: date)
        return date//.components(separatedBy: " ").first!
    }
    //// string -> Date
    static func dateToTimeString(timeStr:String,formatterString:String) -> Date {
        // 日期格式化类
       let formatter = DateFormatter()
        // 设置日期格式(为了转换成功)
        formatter.dateFormat = formatterString
        let date = formatter.date(from: timeStr) 
        return date!
    }
    
    /**
     字典转换为JSONString
     
     - parameter dictionary: 字典参数
     
     - returns: JSONString
     */
  static  func getJSONStringFromDictionary(dictionary:NSDictionary) -> String {
        if (!JSONSerialization.isValidJSONObject(dictionary)) {
            print("无法解析出JSONString")
            return ""
        }
        let data : NSData! = try! JSONSerialization.data(withJSONObject: dictionary, options: []) as NSData?
        let JSONString = NSString(data:data as Data,encoding: String.Encoding.utf8.rawValue)
        return JSONString! as String
        
    }
    
    static func stringConvertDate(string:String, dateFormat:String="yyyy-MM-dd HH:mm:ss") -> Date {
        let dateFormatter = DateFormatter.init()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let date = dateFormatter.date(from: string)
        return date!
    }
    ////截取时间长度转换 yyyymmdd ->  yyyy-mm-dd
    static func stringInterception(str:String) -> String{
        var blackStr = str
        if blackStr.count == 8 {
            let year = blackStr.prefix(4)
            let index2 = blackStr.index(blackStr.startIndex, offsetBy: 4)
            let month = blackStr[index2 ..< blackStr.index(blackStr.startIndex, offsetBy: 6)]
            let day = blackStr[blackStr.index(blackStr.endIndex, offsetBy: -2)..<blackStr.index(blackStr.endIndex,offsetBy:0)]
            blackStr = year + "-" + month + "-" + day 
        }
        return blackStr
    }
    /////string -> CGfloat
    static  func StringToFloat(str:String) -> Float {
        var cgFloat:Float = 0
        if let doubleValue = Double(str){
            cgFloat = Float(doubleValue)
        }
        return cgFloat
    }
    
    
}
