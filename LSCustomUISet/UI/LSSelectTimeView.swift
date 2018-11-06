//
//  LSSelectTimeView.swift
//  HYDriverVersion
//
//  Created by 李丝思 on 2018/4/7.
//  Copyright © 2018年 . All rights reserved.
//

import UIKit

typealias mySelectTimeBlock = (String) -> Void

class LSSelectTimeView: UIView {
    var dateTimePicter:UIDatePicker! = nil
    @IBOutlet weak var topTapBgView: UIView!
    @IBOutlet weak var bgView: UIView!
    var block : mySelectTimeBlock?
    var setTimePiterType:String?{
        didSet{
            dateTimePicter.datePickerMode = .time
        }
    }
    @IBOutlet weak var dateBgView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.topTapBgView.backgroundColor = UIColor.init(white: 0, alpha: 0.55)
        dateTimePicter = UIDatePicker.init(frame: CGRect.init(x: 0, y: 0, width: kScreenWidth, height: 190))
        dateTimePicter.datePickerMode = .date
        self.dateBgView.addSubview(dateTimePicter)
    }
   
   
    func myTimeBlock(yblock: @escaping mySelectTimeBlock)  {
        self.block = yblock
    }
    
    
    @IBAction func comiftBtn(_ sender: UIButton) {
        let formatter = DateFormatter()
        formatter.dateFormat = self.setTimePiterType
        formatter.string(from: self.dateTimePicter.date)
        self.block!( formatter.string(from: self.dateTimePicter.date)  )
    }
    
    
    @IBAction func cancleBtn(_ sender: UIButton) {
         self.block!("取消") 
    }
}
