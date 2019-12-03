//
//  DictionaryExtension.swift
//  HYDriverVersion
//
//  Created by 李丝思 on 2018/4/13.
//  Copyright © 2018年 HY. All rights reserved.
//

import Foundation

extension Dictionary {
     
    
    /// JSONString转换为字典
    ///
    /// - Parameter jsonString: <#jsonString description#>
    /// - Returns: <#return value description#>
    static  func getDictionaryFromJSONString(jsonString:String) -> Dictionary{
        
        let jsonData:Data = jsonString.data(using: .utf8)!
        
        let dict = try? JSONSerialization.jsonObject(with: jsonData, options: .mutableContainers)
        if dict != nil {
            return dict as! Dictionary
        }
        return Dictionary()
    }
    ////Dictiontry-->data
    static func jsonToData(jsonDic:Dictionary<String,Any>) -> Data? {
      
        if (!JSONSerialization.isValidJSONObject(jsonDic)) {
                print("is not a valid json object")
            return nil
        }
        
        let data = try? JSONSerialization.data(withJSONObject: jsonDic, options: [])
        let str = String(data: data!, encoding: String.Encoding.utf8)
        print("Json Str:\(str!)")
        return data
    }
    ////data-->Dictiontry
    static func dataToDictionary(data:Data) -> Dictionary<String,Any>? {
        do {
            let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
            let dict = json as! Dictionary<String,Any>
            return dict
        }catch _ {
            print("转换失败")
            return nil
        }
        
    }
    
    
}
