//
//  ThemeManager.h
//  Weibo
//  主题管理类

//  Created by Ralbatr on 13-10-15.
//  Copyright (c) 2013年 Ralbatr. All rights reserved.
//

#import <Foundation/Foundation.h>

#define kThemeDidChangeNofication @"kThemeDidChangeNofication"

@interface ThemeManager : NSObject
//当前使用的主题名称
@property (nonatomic,copy) NSString *themeName;
//主题字典
@property (nonatomic,retain) NSDictionary *themesPlist;
@property (nonatomic,retain) NSDictionary *fontColorPlist;

+ (ThemeManager *)shareInstantce;
//返回当前主题下，图片名对应的图片
- (UIImage *)getThemeImage:(NSString *)imageName;
//
- (UIColor *)getColorWithName:(NSString *)name;

@end
