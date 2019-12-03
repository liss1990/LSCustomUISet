//
//  OCDemoViewController.m
//  LSCustomUISet
//
//  Created by Ebuy EDITSUITE MAC on 2019/12/3.
//  Copyright © 2019 李丝思. All rights reserved.
//

#import "OCDemoViewController.h"
#import "LSButton.h"
#import "LSMASUtilities.h"
#import "MASConstraint+LSHelper.h"
@interface OCDemoViewController ()

@end

@implementation OCDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self demoUI];
}

 
-(void)demoUI{
    LSWeakSelf(self)
    LSButton *btn = [[LSButton alloc]init]; 
    [self.view addSubview:btn];
    btn.lstitle(@"按钮")
    .titleColor([UIColor redColor])
    .backColor([UIColor blueColor])
    .radius(15)
    .block = ^(UIButton * _Nullable sender) {
        [weakSelf.navigationController popViewControllerAnimated:YES];
    };
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.lsmas_equalTo(100);
        make.left.lsmas_equalTo(15);
        make.size.lsmas_equalTo(CGSizeMake(100, 100));
    }];
    
}

@end
