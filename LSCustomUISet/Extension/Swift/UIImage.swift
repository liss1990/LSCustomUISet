//
//  UIIMage.swift
//  SlideMenuControllerSwift
//
//  Created by Yuji Hato on 11/5/15.
//  Copyright © 2015 Yuji Hato. All rights reserved.
//

import UIKit

extension UIImage {
    func trim(trimRect :CGRect) -> UIImage {
        if CGRect(origin: CGPoint.zero, size: self.size).contains(trimRect) {
            if let imageRef = self.cgImage?.cropping(to: trimRect) {
                return UIImage(cgImage: imageRef)
            }
        }
        
        UIGraphicsBeginImageContextWithOptions(trimRect.size, true, self.scale)
        self.draw(in: CGRect(x: -trimRect.minX, y: -trimRect.minY, width: self.size.width, height: self.size.height))
        let trimmedImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        guard let image = trimmedImage else { return self }
        
        return image
    }
    
    
    /**
     *  压缩上传图片到指定字节
     *
     *  image     压缩的图片
     *  maxLength 压缩后最大字节大小
     *
     *  return 压缩后图片的二进制
     */
    public func compressImage(image: UIImage, maxLength: Int) -> NSData? {
        
//        let newSize = self.scaleImage(image: image, imageLength: 300)
        let newImage = self.resizeImage(image: image, newSize: CGSize(width: 300, height: 300))
        var compress:CGFloat = 0.5
        var data =  UIImageJPEGRepresentation(newImage, compress)
        var i = 0
        while (data?.count)! > maxLength && compress > 0.1 {
            compress -= 0.08
            i += 1
            data = UIImageJPEGRepresentation(newImage, compress)
            print(i)
        }
        print(data?.count)
        return data! as NSData
    }
    ///图片转换成base64String
    public func imageToString(img:UIImage)->String{
        let imageData = UIImagePNGRepresentation(img)
        let str64 = imageData?.base64EncodedString(options: Data.Base64EncodingOptions.lineLength64Characters)
        return str64 ?? ""
    }
//    - (NSString *)imageToString:(UIImage *)image {
//
//    NSData *imagedata = UIImagePNGRepresentation(image);
//
//    NSString *image64 = [imagedata base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
//
//    return image64;
//
//    }
    /**
     *  通过指定图片最长边，获得等比例的图片size
     *
     *  image       原始图片
     *  imageLength 图片允许的最长宽度（高度）
     *
     *  return 获得等比例的size
     */
    func  scaleImage(image: UIImage, imageLength: CGFloat) -> CGSize {
        
        var newWidth:CGFloat = 0.0
        var newHeight:CGFloat = 0.0
        let width = image.size.width
        let height = image.size.height
        
        if (width > imageLength || height > imageLength){
            
            if (width > height) {
                
                newWidth = imageLength;
                newHeight = newWidth * height / width;
                
            }else if(height > width){
                
                newHeight = imageLength;
                newWidth = newHeight * width / height;
                
            }else{
                
                newWidth = imageLength;
                newHeight = imageLength;
            }
            
        }
        return CGSize(width: newWidth, height: newHeight)
    }
    /**
     *  获得指定size的图片
     *
     *  image   原始图片
     *  newSize 指定的size
     *
     *  return 调整后的图片
     */
    func resizeImage(image: UIImage, newSize: CGSize) -> UIImage {
        UIGraphicsBeginImageContext(newSize)
        image.draw(in: CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage!
    }
    
    
    /// 将图片保存在本地
    ///
    /// - Parameters:
    ///   - currentImage:
    ///   - persent:
    ///   - imageName:
    func saveImage(currentImage: UIImage, persent: CGFloat, imageName: String)->String{
        if let imageData = UIImageJPEGRepresentation(currentImage, 1) as NSData? {
            let fullPath = NSHomeDirectory().appending("/Documents/").appending(imageName)
            imageData.write(toFile: fullPath, atomically: true)
            print("fullPath=\(fullPath)")
            return fullPath
        }
        return "图片保存失败！"
    }
    
    /// 删除本地图片
    ///
    /// - Parameter fileUrl:
    /// - Returns:  
    func delectManagerImage(fileUrl:String)->Bool {
        let DelectManager = FileManager.default
        let DelectFromUrl = NSHomeDirectory() + "/Documents/\(fileUrl)"
        try! DelectManager.removeItem(atPath: DelectFromUrl)
        let exist = DelectManager.fileExists(atPath: DelectFromUrl)
        return exist
    }
   
}
