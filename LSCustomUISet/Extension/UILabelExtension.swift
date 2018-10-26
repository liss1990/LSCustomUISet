//
//  UILabelExtension.swift
//  HYDriverVersion
//
//  Created by 李丝思 on 2018/3/23.
//  Copyright © 2018年 HY. All rights reserved.
//

import UIKit
extension UILabel {
    
    func getLabHeigh(labelStr:String,font:UIFont,width:CGFloat) -> CGFloat {
        
        let statusLabelText: String = labelStr
        
        let size = CGSize.init(width: width, height: 900)
        
        let dic = NSDictionary(object: font, forKey: NSAttributedString.Key.font as NSCopying)
        
        let strSize = statusLabelText.boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: dic as? [NSAttributedString.Key : Any]  , context: nil).size
        
        return strSize.height
        
    }

    func getLabWidth(labelStr:String,font:UIFont,height:CGFloat) -> CGFloat {
        
        let statusLabelText:  String = labelStr  
        
        let size = CGSize.init(width:900, height:height)
        
        let dic = NSDictionary(object: font, forKey: NSAttributedString.Key.font as NSCopying)
        
        let strSize = statusLabelText.boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: dic as? [NSAttributedString.Key : Any]  , context: nil).size
        
        return strSize.width
        
    }
    
}


