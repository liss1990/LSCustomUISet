//
//  MASConstraint+LSHelper.h
//  LFSHZ
//
//  Created by Ebuy EDITSUITE MAC on 2019/12/2.
//  Copyright © 2019 com.ebuyhouse.www. All rights reserved.
//
 

#import "MASConstraint.h"

NS_ASSUME_NONNULL_BEGIN



@interface MASConstraint (LSHelper)
  

- (MASConstraint * (^)(id attr))lsmas_equalTo;
- (MASConstraint * (^)(CGFloat offset))ls_offset;
- (MASConstraint * (^)(MASEdgeInsets))ls_insets;

- (MASConstraint * (^)(id attr))lsmas_greaterThanOrEqualTo;
- (MASConstraint * (^)(id attr))lsmas_lessThanOrEqualTo;
- (MASConstraint * (^)(id offset))lsmas_offset;
@end

NS_ASSUME_NONNULL_END
