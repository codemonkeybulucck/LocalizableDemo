//
//  LocalizableHelper.h
//  LocalizableDemo
//
//  Created by Mtel on 2017/6/8.
//  Copyright © 2017年 Mtel. All rights reserved.
//
#import <Foundation/Foundation.h>

//定义取字符串宏给外界调用
#define LocalizableHelperGetStringWithKeyFromTable(key,tb) [[LocalizableHelper shareInstance] getStringWithKey:key table:tb]
#define LANGUAGEHADCHANGED @"languageHadChanged"

//app支持的语言的枚举
typedef NS_ENUM(NSUInteger,Language){
    Language_zh_Hans = 0,  //中文
    Language_en            //英文
};


@interface LocalizableHelper : NSObject

/**
 单例

 @return 实例
 */
+ (instancetype)shareInstance;

/**
 根据key和table获取文本

 @param key key
 @param table table(实际上是对应的strings的文件名)
 @return 文本
 */
- (NSString *)getStringWithKey:(NSString *)key table:(NSString*)table;


/**
 传入语言切换app语言并发出通知

 @param language 待切换的语言
 */
- (void)changeLanguage:(Language)language;

@end
