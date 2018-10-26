//
//  HYPopView.swift
//  Driver
//
//  Created by 李丝思 on 2018/9/26.
//  Copyright © 2018 李丝思. All rights reserved.
//

import UIKit

class HYPopView: NSObject {
    var rightItemView = HYRightItemView.loadNib()
    var selectCellBlock:BackData?
    var array : Array<String>=["选择一","选择二"]{
        didSet{
            self.rightItemView.array = array
        }
    }
    var frame : CGRect?{
        didSet{
            self.rightItemView.frame = frame!
        }
    }
    
    override init() {
        super.init()
        rightItemView = HYRightItemView.loadNib()
        rightItemView.isOpaque = false
        rightItemView.setBlock {[unowned self] str in
            let nStr = str as! String
            self.selectCellBlock!(nStr)
            self.rightViewShow(show: true)
        }
    }
    ///右上角展示
    func rightViewShow(show:Bool)  {
        
        if show == true {
            UIView.animate(withDuration: 0.2) {
                self.rightItemView.alpha = 0
                self.rightItemView.isOpaque = false
            }
            self.rightItemView.removeFromSuperview()
        }else{
            self.rightItemView.isOpaque = false
            self.rightItemView.alpha = 0
            UIView.animate(withDuration: 0.2) {
                self.rightItemView.alpha = 1
                self.rightItemView.isOpaque = true
            }
            UIApplication.shared.keyWindow?.addSubview(rightItemView)
        }
        
    }
    func setBlock(block:@escaping BackData) {
        self.selectCellBlock = block
    }
    
    func hiddenView()  {
        self.rightViewShow(show: true)
    }
    func showView()  {
        self.rightViewShow(show: false)
    }
    
}
