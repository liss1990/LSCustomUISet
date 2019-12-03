//
//  MASConstraint+LSHelper.m
//  LFSHZ
//
//  Created by Ebuy EDITSUITE MAC on 2019/12/2.
//  Copyright © 2019 com.ebuyhouse.www. All rights reserved.
//
#import <Masonry/Masonry.h>
#import "MASConstraint+LSHelper.h"
#import "LSMASUtilities.h"
 
#define LSMASMethodNotImplemented() \
@throw [NSException exceptionWithName:NSInternalInconsistencyException \
                               reason:[NSString stringWithFormat:@"You must override %@ in a subclass.", NSStringFromSelector(_cmd)] \
                             userInfo:nil]

@implementation MASConstraint (LSHelper)

- (MASConstraint * (^)(id, NSLayoutRelation))LSequalToWithRelation { LSMASMethodNotImplemented(); }

- (MASConstraint * (^)(id))lsmas_equalTo {
    return ^id(id attribute) {
        return self.LSequalToWithRelation(attribute, NSLayoutRelationEqual);
    };
}

- (MASConstraint * (^)(CGFloat))ls_offset {
    return ^id(CGFloat ls_offset){
        self.offset = ls_offset * SCREEN_SCALE;
        return self;
    };
}

- (MASConstraint * (^)(MASEdgeInsets))ls_insets {
    return ^id(MASEdgeInsets ls_insets){
        ls_insets.top = ls_insets.top * SCREEN_SCALE;
        ls_insets.left = ls_insets.left * SCREEN_SCALE;
        ls_insets.bottom = ls_insets.bottom * SCREEN_SCALE;
        ls_insets.right = ls_insets.right * SCREEN_SCALE;
        self.insets = ls_insets;
        return self;
    };
}

- (MASConstraint * (^)(id))lsmas_greaterThanOrEqualTo {
    return ^id(id attribute) {
        return self.LSequalToWithRelation(attribute, NSLayoutRelationGreaterThanOrEqual);
    };
}

- (MASConstraint * (^)(id))lsmas_lessThanOrEqualTo {
    return ^id(id attribute) {
        return self.LSequalToWithRelation(attribute, NSLayoutRelationLessThanOrEqual);
    };
}

- (MASConstraint * (^)(id offset))lsmas_offset {
    // Will never be called due to macro
    return nil;
}


@end
