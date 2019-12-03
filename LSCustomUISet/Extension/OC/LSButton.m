//
//  LFSButtton.m
//  LFSHZ
//
//  Created by amyzhou on 2019/11/18.
//  Copyright © 2019 com.ebuyhouse.www. All rights reserved.
//

#import "LSButton.h"

@interface LSButton()
@property(nonatomic,copy)NSString *imgName;

@end


@implementation LSButton


- (instancetype)init
{
    self = [super init];
    if (self) {
        [self addTarget:self action:@selector(tapBtn:) forControlEvents:1<<6];
    }
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if (self) {
        [self addTarget:self action:@selector(tapBtn:) forControlEvents:1<<6];
    }
    return self;
}
 
-(LSButton*(^)(NSString*))title{
     
   LSButton *(^result)(NSString*) = ^(NSString *value){
       [self setTitle:value forState:0];
       return self;
   };
   return result;
     
}
 
-(LSButton*(^)(UIFont*))titleFont{
     
    LSButton *(^result)(UIFont*) = ^(UIFont *value){
        self.titleLabel.font = value;
        return self;
    };
    
    return result;
}

-(LSButton*(^)(UIColor*))titleColor{
     
    LSButton *(^result)(UIColor*) = ^(UIColor *value){
        [self setTitleColor:value forState:0];
        return self;
    };
    
    return result;
}

 -(LSButton*(^)(UIColor*))backColor{
      
     LSButton *(^result)(UIColor*) = ^(UIColor *value){
         [self setBackgroundColor:value];
         return self;
     };
     
     return result;
 }

-(LSButton*(^)(CGFloat))radius{
    LSButton *(^result)(CGFloat) = ^(CGFloat value){
       if (value > 0.0) {
            self.layer.masksToBounds = YES;
            self.layer.cornerRadius = value;
        }
        return self;
    };
    
    return result;
    
}
  
-(LSButton*(^)(NSString*))imageName{
    LSButton *(^result)(NSString*) = ^(NSString *value){
        self.imgName = value;
        [self setImage:[UIImage imageNamed:value ] forState:0];
        return self;
    };
    
    return result;
    
}
 
-(LSButton*(^)(NSDictionary*))imagWithSate{
    LSButton *(^result)(NSDictionary*) = ^(NSDictionary *value){
        NSString *imgName = value[@"imageName"];
        NSInteger state = [value[@"state"] intValue];
        self.imgName = imgName;
        switch (state) {
            case 0:
            {
                [self setImage:[UIImage imageNamed:imgName ] forState:UIControlStateNormal];
            }
                break;
            case 1:
            {
                [self setImage:[UIImage imageNamed:imgName ] forState:UIControlStateHighlighted];
            }
                break;
            case 4:
            {
                 [self setImage:[UIImage imageNamed:imgName ] forState:UIControlStateSelected];
            }
                break;
            default:
                  [self setImage:[UIImage imageNamed:imgName ] forState:UIControlStateNormal];
                break;
        }
        return self;
      };
      
    return result;
}


-(LSButton*(^)(ImgDirection))imgDriection{
    LSButton *(^result)(ImgDirection) = ^(ImgDirection value){
        if (!self.imgName) {
            return self;
        }
        CGFloat    space = 5;// 图片和文字的间距
        NSString    *titleString = self.titleLabel.text;
        CGFloat    titleWidth = [titleString sizeWithAttributes:@{NSFontAttributeName:self.titleLabel.font}].width;
        UIImage    * btnImage = [UIImage imageNamed:self.imgName];
        CGFloat    imageWidth = btnImage.size.width;
        CGFloat    btnWidth = self.bounds.size.width;// 按钮的宽度
        if (titleWidth > btnWidth - imageWidth - space) {
            titleWidth = btnWidth- imageWidth - space;
        }
        CGFloat    imageHeight = btnImage.size.height;
        CGFloat    titleHeight = [titleString sizeWithAttributes:@{NSFontAttributeName:self.titleLabel.font}].height;
        switch (value) {
            case ImgDirection_Top:
            {
                [self setTitleEdgeInsets:UIEdgeInsetsMake((titleHeight+space)*0.5, -imageWidth*0.5, -(titleHeight+space)*0.5, imageWidth*0.5)];
                [self setImageEdgeInsets:UIEdgeInsetsMake(-(imageHeight+space)*0.5, titleWidth*0.5, (imageHeight+space)*0.5, -titleWidth*0.5)];
            }
                break;
            case ImgDirection_Left:
            {
                [self setTitleEdgeInsets:UIEdgeInsetsMake(0, (space*0.5), 0, -(space*0.5))];
                [self setImageEdgeInsets:UIEdgeInsetsMake(0, -(space*0.5), 0, (space*0.5))];
            }
                break;
            case ImgDirection_Down:
            {
                [self setTitleEdgeInsets:UIEdgeInsetsMake(-(titleHeight+space)*0.5, -imageWidth*0.5, (titleHeight+space)*0.5, imageWidth*0.5)];
                [self setImageEdgeInsets:UIEdgeInsetsMake((imageHeight+space)*0.5, titleWidth*0.5, -(imageHeight+space)*0.5, -titleWidth*0.5)];
            }
                break;
            case ImgDirection_Right:
            {
                 [self setTitleEdgeInsets:UIEdgeInsetsMake(0, -(imageWidth+space*0.5), 0, (imageWidth+space*0.5))];
                [self setImageEdgeInsets:UIEdgeInsetsMake(0, (titleWidth + space*0.5), 0, -(titleWidth + space*0.5))];
            }
                break;
            default:
                 [self setTitleEdgeInsets:UIEdgeInsetsMake(0, (space*0.5), 0, -(space*0.5))];
                [self setImageEdgeInsets:UIEdgeInsetsMake(0, -(space*0.5), 0, (space*0.5))];
                break;
        }
        return self;
    };
    
    return result;
    
}
 

-(void)tapBtn:(UIButton*)sender{
    if (self.block) {
        self.block(sender);
    }
    
}

- (void)dealloc
{
    NSLog(@"%s",__func__);
}

@end
