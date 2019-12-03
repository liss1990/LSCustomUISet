//
//  HYVoicePrompt.swift
//  HYDriverVersion
//
//  Created by 李丝思 on 2018/4/10.
//  Copyright © 2018年 HY. All rights reserved.
//

import UIKit
import AVFoundation
class HYUnitModel: NSObject {
    var imgeSelect:ImgeBlock?
    lazy var synthesizer = AVSpeechSynthesizer()
    lazy var voices =  AVSpeechSynthesisVoice.init(language: "zh-CN")
    lazy var speechStrings = [String]()
}

extension HYUnitModel {
    ///系统语音播报
    public  func beginConversation(str:String) {
        self.speechStrings.removeAll()
        self.speechStrings.append(str)
        for  i in 0...self.speechStrings.count-1 {
            let utterance = AVSpeechUtterance.init(string: self.speechStrings[i])
            utterance.voice = self.voices
            utterance.rate = 0.5
            utterance.pitchMultiplier = 1
            utterance.postUtteranceDelay = 1.0
            self.synthesizer.speak(utterance)
        }
    }
    
    /// 拨打电话
    ///
    /// - Parameter tell:
    public func callPhone(tell:String) {
        let urlString = "tel://" + tell
        if let url = URL(string: urlString) {
            //根据iOS系统版本，分别处理
            if #available(iOS 10, *) {
                UIApplication.shared.open(url, options: [:],
                                          completionHandler: {
                                            (success) in
                })
            } else {
                UIApplication.shared.openURL(url)
            }
        }
    }
    
    
    func showAlart(vc:UIViewController,title:String,meagess:String,sureTitle:String,cancleTitle:String,block:@escaping BackData)  {
        
        let alertController = UIAlertController(title: title, message: meagess, preferredStyle: .alert)
        let canceAction = UIAlertAction(title: cancleTitle, style: .cancel) { (action) in
            
        }
        let okAction = UIAlertAction(title: sureTitle, style: .default) { (action) in
            block("ok")
        }
        alertController.addAction(okAction)
        alertController.addAction(canceAction)
        vc.present(alertController, animated: true, completion: nil)
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
        return date
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


extension HYUnitModel:UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    
    static func alertShow(vc:UIViewController, title:String,message:String,preferredStyle:UIAlertController.Style ,confirm: ((UIAlertAction)->Void)?){
        let alertController :UIAlertController?
        if title.count == 0 {
            alertController = UIAlertController(title: nil, message: nil, preferredStyle: preferredStyle)
        }else{
            alertController = UIAlertController(title: title, message: message, preferredStyle: preferredStyle)
        }
        
        let cancleAction = UIAlertAction(title: "取消", style: .cancel, handler: nil)
        let cameraAction = UIAlertAction(title: "拍照", style: .default,handler :confirm)
        let photoAction = UIAlertAction(title: "从手机相册选择", style: .default,handler :confirm)
        alertController!.addAction(cancleAction)
        alertController!.addAction(cameraAction)
        alertController!.addAction(photoAction)
        vc.present(alertController!, animated: true, completion: nil)
    }
    
    func selectImageData(vc:UIViewController,sourceType:UIImagePickerController.SourceType){
        
        let picker :UIImagePickerController = UIImagePickerController()
        picker.delegate = self as UIImagePickerControllerDelegate & UINavigationControllerDelegate
        picker.sourceType = sourceType
        picker.allowsEditing = true
        if UIImagePickerController.isSourceTypeAvailable(.camera) || UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
            vc.present(picker, animated: true) {
                
            }
        }else{
            print("未授权相机相册！")
        }
        
    }
    
    func setImageBlock(block:@escaping ImgeBlock)  {
        self.imgeSelect = block
        
    }
    
//    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
//        if let chosenImage =  info[UIImagePickerControllerOriginalImage] as? UIImage {
//            picker.dismiss(animated: true) {
//                self.imgeSelect!(chosenImage)
//            }
//        }
//    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
