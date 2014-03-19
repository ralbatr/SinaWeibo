//
//  ThemeManager.m
//  Weibo
//
//  Created by Ralbatr on 13-10-15.
//  Copyright (c) 2013年 Ralbatr. All rights reserved.
//

#import "ThemeManager.h"


static ThemeManager *sigleton = nil;
@implementation ThemeManager

+ (ThemeManager *)shareInstantce
{
    if (sigleton == nil) {
        @synchronized(self)
        {
            sigleton = [[ThemeManager alloc] init];
        }
    }
    return sigleton;
}

- (id)init
{
    self = [super init];
    if (self) {
        NSString *themePath = [[NSBundle mainBundle] pathForResource:@"theme" ofType:@"plist"];
        self.themesPlist = [NSDictionary dictionaryWithContentsOfFile:themePath];
//        [NSDictionary dictionaryWithContentsOfFile:themePath];
        //默认为空
        self.themeName = nil;
        
    }
    return self;
}
// 切换主题时，会调用此方法设置主题名称
- (void)setThemeName:(NSString *)themeName
{
    if (_themeName != themeName) {
        [_themeName release];
        _themeName = [themeName copy];
    }
    
    NSString *themeDir = [self getThemePath];
    NSString *filePath = [themeDir stringByAppendingPathComponent:@"fontColor.plist"];
    self.fontColorPlist = [NSDictionary dictionaryWithContentsOfFile:filePath];
}
//获取主题目录
- (NSString *)getThemePath
{
    if (_themeName == nil) {
        //获取bundle的根目录
        NSString *resourcePath= [[NSBundle mainBundle] resourcePath];
        return resourcePath;
    }
    //取得主题路径
    NSString *themePath = [self.themesPlist objectForKey:_themeName];
    //获取bundle的根目录
    NSString *resourcePath= [[NSBundle mainBundle] resourcePath];
    //完整的路径名
    NSString *path = [resourcePath stringByAppendingPathComponent:themePath];
    return path;
}

//返回当前主题下，图片名对应的图片
- (UIImage *)getThemeImage:(NSString *)imageName
{
    if (imageName.length == 0) {
        return nil;
    }
    //获取主题目录
    NSString *themePath = [self getThemePath];
    //imageName在当前主题的路径     
    NSString *imagePath = [themePath stringByAppendingPathComponent:imageName];    
    UIImage *image = [UIImage imageWithContentsOfFile:imagePath];
    return image;
}

- (UIColor *)getColorWithName:(NSString *)name
{
    if (name.length == 0) {
        return nil;
    }

    //返回三色值，如：24,35,60
    NSString *rgb = [_fontColorPlist objectForKey:name];
    NSArray *rgbs = [rgb componentsSeparatedByString:@","];
    if (rgbs.count == 3) {
        float r = [rgbs[0] floatValue];
        float g = [rgbs[1] floatValue];
        float b = [rgbs[2] floatValue];
        UIColor *color = Color(r, g, b, 1);
        return color;
    }
    
    return nil;
}

#pragma mark --sengleton setting
+ (id)allocWithZone:(NSZone *)zone
{
    @synchronized(self)
    {
        if (sigleton == nil) {
            sigleton = [super allocWithZone:zone];
        }
    }
    return sigleton;
}

+ (id)copyWithZone:(NSZone *)zone
{
    return self;
}

- (id)retain
{
    return self;
}

- (unsigned)retainCount
{
    return UINT_MAX;
}

- (oneway void)release
{
    
}

- (id)autorelease
{
    return self;
}

@end
