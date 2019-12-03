//
//  LFSButtton.h
//  LFSHZ
//
//  Created by amyzhou on 2019/11/18.
//  Copyright © 2019 com.ebuyhouse.www. All rights reserved.
//

#import <UIKit/UIKit.h>
#define LSWeakSelf(type) __weak __typeof__(type) weakSelf = type;
#define LSStrongSelf(type) __strong __typeof__(type) strongSelf = type;

typedef void(^LFSBtnBlock)(UIButton * _Nullable sender);
typedef enum : NSUInteger {
    ImgDirection_Top,
    ImgDirection_Left,
    ImgDirection_Down,
    ImgDirection_Right
} ImgDirection;

NS_ASSUME_NONNULL_BEGIN

@interface LSButton : UIButton
 
///  设置 按钮文字
-(LSButton*(^)(NSString*))title;
///  设置 字体
-(LSButton*(^)(UIFont*))titleFont;
///  设置 字体颜色
-(LSButton*(^)(UIColor*))titleColor;
///  设置背景 图片
-(LSButton*(^)(UIColor*))backColor;
///  设置 按钮画圆
-(LSButton*(^)(CGFloat))radius;
///  设置 图片
-(LSButton*(^)(NSString*))imageName;
///    同时设置 图片 imageName: 和 状态 state:
-(LSButton*(^)(NSDictionary*))imagWithSate;
 ///  设置小图片在文字的方向
-(LSButton*(^)(ImgDirection))imgDriection;
///  回调方式
@property(nonatomic,copy)LFSBtnBlock   block;

@end

NS_ASSUME_NONNULL_END
