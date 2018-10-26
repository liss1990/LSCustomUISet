//
//  SSProgressView.swift
//  Driver
//
//  Created by 李丝思 on 2018/9/27.
//  Copyright © 2018 李丝思. All rights reserved.
//

import UIKit

enum SSProgressViewStyle {
    case SSProgressViewStyleDefault
    case SSProgressViewStyleTrackFillet
    case SSProgressViewStyleAllFillet
}

class SSProgressView: UIView {
 
    var style : SSProgressViewStyle? = SSProgressViewStyle.SSProgressViewStyleDefault{
        didSet{
            switch style! {
            case SSProgressViewStyle.SSProgressViewStyleDefault:
                
                break
            case SSProgressViewStyle.SSProgressViewStyleAllFillet:
                self.layer.masksToBounds = true
                self.layer.cornerRadius = self.bounds.size.height/2
                self.progressView?.layer.cornerRadius = self.bounds.size.height/2
                break
            case SSProgressViewStyle.SSProgressViewStyleTrackFillet:
                
               break
            }
            
        }
        
    }
    var progressTintColor:UIColor?{
        didSet{
            progressView?.backgroundColor = progressTintColor
        }
    }
    var trackTintColor:UIColor?{
        didSet{
            self.backgroundColor = trackTintColor
        }
    }
    var isTile = false{
        didSet{
            
            
        }
    }
    var progressImg:UIImage?
    var trackImg:UIImage?{
        didSet{
            if self.isTile {
                self.backgroundColor = UIColor.init(patternImage: trackImg!)
            }else{
                self.backgroundColor = UIColor.init(patternImage: self.stretchableWithImage(img: trackImg!))
            }
        }
    }
    
    var progressView:UIView?
    var progress:CGFloat?{
        didSet{
            let newProgress = min(progress ?? 0, 1)
            self.progressView?.frame = CGRect(x: 0, y: 0, width: self.bounds.size.width * newProgress, height: self.bounds.size.height)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        progressView = UIView.init(frame: CGRect(x: 0, y: 0, width: 0, height: frame.size.height))
        progress = 0.0
        self.addSubview(progressView!)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
    func stretchableWithImage(img:UIImage) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(self.frame.size, false, 0.0)
        img.draw(in: self.bounds)
        let lastImg = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return lastImg!
    }

}
