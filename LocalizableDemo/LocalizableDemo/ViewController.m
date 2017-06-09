//
//  ViewController.m
//  LocalizableDemo
//
//  Created by Mtel on 2017/6/8.
//  Copyright © 2017年 Mtel. All rights reserved.
//

#import "ViewController.h"
#import "LMFollowSystemViewController.h"
#import "LMFollowAPPViewController.h"
#import "LocalizableHelper.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *systemButton;
@property (weak, nonatomic) IBOutlet UIButton *appButton;

- (IBAction)followSystemLanguageViewController;
- (IBAction)followAppLanguageViewController;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.systemButton setTitle:LocalizableHelperGetStringWithKeyFromTable(@"followSystemButton", @"FollowAPPLanguage") forState:UIControlStateNormal];
    [self.appButton setTitle:LocalizableHelperGetStringWithKeyFromTable(@"followAPPButton", @"FollowAPPLanguage") forState:UIControlStateNormal];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)followSystemLanguageViewController {
    LMFollowSystemViewController *vc  = [[LMFollowSystemViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)followAppLanguageViewController {
    LMFollowAPPViewController *vc = [[LMFollowAPPViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}
@end
