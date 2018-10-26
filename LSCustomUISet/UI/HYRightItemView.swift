//
//  HYRightItemView.swift
//  Driver
//
//  Created by 李丝思 on 2018/9/21.
//  Copyright © 2018年 李丝思. All rights reserved.
//

import UIKit

class HYRightItemView: UIView {

    var selectCellBlock:BackData?
    var tableView:UITableView = {
        var table = UITableView.init(frame: CGRect.zero)
        table.registerCellClass(UITableViewCell.self)
        table.rowHeight = 40
        table.tableFooterView = UIView.init()
        return table
    }()
    var v = UIView()
    var array = ["一号","二号"]{
        didSet{
            self.tableView.frame = CGRect(x: 0, y: Int(self.v.frame.maxY), width: 100, height: array.count * 40 )
            self.tableView.reloadData()
        }
    }
    
    override func awakeFromNib() {
         v = UIView.init(frame: CGRect(x:  self.frame.size.width/3 * 2 - 10, y: 0, width: 16, height: 10))
        self.addSubview(v)
        
        let startPoint = CGPoint(x: 0, y: 10)
        let endPoint = CGPoint(x: 16, y: 10)
        let path = UIBezierPath.init()
        path.move(to: startPoint)
        
        path.addQuadCurve(to: endPoint, controlPoint: CGPoint(x: 8, y: -10))
        let pathLayer = CAShapeLayer.init()
        pathLayer.lineWidth = 1
        pathLayer.fillColor = COLOR_NAV.cgColor
        pathLayer.path = path.cgPath
        v.layer.addSublayer(pathLayer)
        
        tableView.frame = CGRect(x: 0, y: v.frame.maxY, width: 100, height: 80)
        tableView.delegate = self
        tableView.dataSource = self
        self.addSubview(tableView)
        
        tableView.layer.cornerRadius = 5
        tableView.layer.shadowColor = color_240.cgColor
        tableView.layer.shadowOffset = CGSize(width: 2, height: 5)
        tableView.layer.shadowOpacity = 0.5
        tableView.layer.shadowRadius = 5
        
    }
    
    func setBlock(block:@escaping BackData) {
        self.selectCellBlock = block
    }

}
extension HYRightItemView:UITableViewDelegate,UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        cell.selectionStyle = .none
        cell.textLabel?.text = self.array[indexPath.row]
        cell.textLabel?.font = UIFont.systemFont(ofSize: 14)
        cell.backgroundColor = COLOR_NAV
        cell.textLabel?.textColor = .white
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.selectCellBlock!(self.array[indexPath.row])
        
    }
    
}
