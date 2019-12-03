//
//  ViewController.swift
//  LSCustomUISet
//
//  Created by 李丝思 on 2018/10/26.
//  Copyright © 2018 李丝思. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var popView = HYPopView.init()
    var ocVc  = OCDemoViewController()
    override func viewDidLoad() {
        super.viewDidLoad()
        popView.frame = CGRect(x: kScreenWidth-110, y: (self.navigationController?.navigationBar.frame.maxY)!, width: 100, height: 80)
        popView.array = ["萝卜","白菜"]
        popView.setBlock { str in
            print(str as! String)
        }
         
        let btn = UIButton.init(type: .custom)
        btn.frame = CGRect.init(x: 100, y: 100, width: 100, height: 100);
        self.view.addSubview(btn)
        btn.backgroundColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
        btn.setTitle("按钮", for: .normal)
        btn.addTarget(self, action: #selector(tapBtn), for: .touchUpInside)
         
    }
    
    @objc func tapBtn(){
        self.navigationController?.pushViewController(ocVc, animated: true)
        
    }

    @IBAction func tapRightItem(_ sender: UIBarButtonItem) {
         popView.showView()
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        popView.hiddenView()
    }
}

