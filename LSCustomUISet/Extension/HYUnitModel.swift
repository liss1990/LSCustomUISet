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
