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
    override func viewDidLoad() {
        super.viewDidLoad()
          popView.frame = CGRect(x: kScreenWidth-110, y: (self.navigationController?.navigationBar.frame.maxY)!, width: 100, height: 80)
        popView.array = ["萝卜","白菜"]
        popView.setBlock { str in
            print(str as! String)
        }
    }

    @IBAction func tapRightItem(_ sender: UIBarButtonItem) {
         popView.showView()
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        popView.hiddenView()
    }
}

