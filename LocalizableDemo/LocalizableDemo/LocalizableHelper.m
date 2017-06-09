//
//  LocalizableHelper.m
//  LocalizableDemo
//
//  Created by Mtel on 2017/6/8.
//  Copyright © 2017年 Mtel. All rights reserved.
//

#import "LocalizableHelper.h"

#define CNS @"zh-Hans"
#define EN @"en"
#define CURRENTLANGUAGE @"currentLanguage"

@interface LocalizableHelper()
@property (nonatomic,strong) NSBundle *currentBundle;
@property (nonatomic,assign) Language currentLanguage;
@end

@implementation LocalizableHelper
/**
 单例
 
 @return 实例
 */
+ (instancetype)shareInstance{
    static id instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc]init];
    });
    return instance;
}

- (instancetype)init{
    if (self = [super init]) {
        [self initLanguage];
    }
    return  self;
}

//初始化语言，默认是中文
-(void)initLanguage{
    NSNumber *number = [[NSUserDefaults standardUserDefaults] valueForKey:CURRENTLANGUAGE];
    if (!number) {
        [[NSUserDefaults standardUserDefaults]setValue:@(Language_zh_Hans) forKey:CURRENTLANGUAGE];
    }
    [self setUpCurrentBundle:Language_zh_Hans];
}

- (void)setUpCurrentBundle:(Language)language{
    //获取当前的语言所在路径并且获取bundle，如果bundle不存在则创建
    NSString *language_Str = [self getStringWithLanguage:language];
    NSAssert(language_Str != nil, @"language的值有误");
    //在mainbundle下每种语言都会产生一个 语言名字.lproj 的文件，文件里面包含了对应的table（即strings文件）
    NSString *path = [[NSBundle mainBundle] pathForResource:language_Str ofType:@"lproj"];
    self.currentLanguage = language;
    [[NSUserDefaults standardUserDefaults] setValue:@(language) forKey:CURRENTLANGUAGE];
    self.currentBundle = [NSBundle bundleWithPath:path];
}


- (NSString*)getStringWithLanguage:(Language)language{
    switch (language) {
        case Language_zh_Hans:
            return @"zh_Hans";
            break;
            case  Language_en:
            return @"en";
        default:
            return nil;
            break;
    }
}

/**
 在当前的bundle下，根据key和table获取文本
 
 @param key key
 @param table table(实际上是对应的strings的文件名)
 @return 文本
 */
- (NSString *)getStringWithKey:(NSString *)key table:(NSString*)table{
    if (self.currentBundle) {
        return  NSLocalizedStringFromTableInBundle(key, table, self.currentBundle, @"");
    }
    else{
        return NSLocalizedStringFromTable(key, table, @"");
    }
}


/**
 传入语言切换app语言并发出通知
 
 @param language 待切换的语言
 */
- (void)changeLanguage:(Language)language{
    
    if (language == self.currentLanguage) {
        return;
    }
    //改变当前的bundle
    [self setUpCurrentBundle:language];
    //发出通知，让其他控制器重新加载控制器（可以在APPDelagate里面设置）
    [[NSNotificationCenter defaultCenter] postNotificationName:LANGUAGEHADCHANGED object:self userInfo:nil];
    
}


@end
