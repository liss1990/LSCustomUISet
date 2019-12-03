//
//  UIFont+LFSCustomize.m
//  LFSHZ
//
//  Created by Ebuy EDITSUITE MAC on 2019/11/22.
//  Copyright © 2019 com.ebuyhouse.www. All rights reserved.
//

#import "UIFont+LSCustomize.h"
#import "LSMacro.h"


@implementation UIFont (LSCustomize)

+(UIFont*)ls_systemFont:(CGFloat)font{
    return [UIFont systemFontOfSize:font * SCREEN_SCALE];
}

+(UIFont*)ls_systemBoldFont:(CGFloat)font{
    return  [UIFont boldSystemFontOfSize:font * SCREEN_SCALE];
}


@end
