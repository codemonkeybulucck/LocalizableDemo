//
//  LMFollowAPPViewController.m
//  LocalizableDemo
//
//  Created by Mtel on 2017/6/8.
//  Copyright © 2017年 Mtel. All rights reserved.
//

#import "LMFollowAPPViewController.h"
#import "LocalizableHelper.h"

@interface LMFollowAPPViewController ()

@end

@implementation LMFollowAPPViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self setUpUI];
}


- (void)setUpUI{
    
    CGFloat width = 200;
    CGFloat height = 40;
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    UIButton *button1 = [[UIButton alloc]initWithFrame:CGRectMake((screenWidth - width)*0.5, 100,width , height)];
    [button1 setBackgroundColor:[UIColor blackColor]];
    [button1 setTitle:@"点击切换成中文" forState:UIControlStateNormal];
    [button1 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button1 addTarget:self action:@selector(changeLanguageToChinese) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button1];
    
    UIButton *button2 = [[UIButton alloc]initWithFrame:CGRectMake((screenWidth - width)*0.5, CGRectGetMaxY(button1.frame)+20,width , height)];
    [button2 setBackgroundColor:[UIColor blackColor]];
    [button2 setTitle:@"点击切换成英文" forState:UIControlStateNormal];
    [button2 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button2 addTarget:self action:@selector(changeLanguageToEnglish) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button2];
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(button2.frame)+20, screenWidth, height)];
    label.textAlignment = NSTextAlignmentCenter;
    label.numberOfLines = 0;
    [self.view addSubview:label];
    
    //调用LocalizableHelper提供的宏去设置文本，默认是中文
    label.text = LocalizableHelperGetStringWithKeyFromTable(@"contentLable", @"FollowAPPLanguage");
    
}

//切换语言的行为也会影响其他控制器的文本，如果使用了LocalizableHelperGetStringWithKeyFromTable 这个宏的话都会受到影响。
//作为示例，如果点击了这里切换语言，那么首页ViewController也会根据当前的设置更换语言
- (void)changeLanguageToChinese{
    [[LocalizableHelper shareInstance] changeLanguage:Language_zh_Hans];
}

- (void)changeLanguageToEnglish{
    [[LocalizableHelper shareInstance] changeLanguage:Language_en];
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
