//
//  LMFollowAPPViewController.m
//  LocalizableDemo
//
//  Created by Mtel on 2017/6/8.
//  Copyright © 2017年 Mtel. All rights reserved.
//

#import "LMFollowSystemViewController.h"

@interface LMFollowSystemViewController ()

@end

@implementation LMFollowSystemViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self setUpUI];
}

- (void)setUpUI{
    
    CGFloat width = 100;
    CGFloat height = 40;
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake((screenWidth - width)*0.5, 100,width , height)];
    [button setBackgroundColor:[UIColor blackColor]];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.view addSubview:button];
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(button.frame)+20, screenWidth, height)];
    label.textAlignment = NSTextAlignmentCenter;
    label.numberOfLines = 0;
    [self.view addSubview:label];
    
    //使用本地化设置text
    //如果系统的语言是英文，那么就会去Localizable.stings(English)里面根据“LoginButtonText”这个key去查找
    //如果系统的语言是英文，那么就会去Localizable.stings(Simplified)里面根据“LoginButtonText”这个key去查找
    [button setTitle:NSLocalizedString(@"LoginButtonText", @"") forState:UIControlStateNormal];
    label.text = NSLocalizedString(@"LabelText", @"");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
