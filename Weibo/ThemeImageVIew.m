//
//  ThemeImageVIew.m
//  Weibo
//
//  Created by Ralbatr on 13-10-24.
//  Copyright (c) 2013年 Ralbatr. All rights reserved.
//

#import "ThemeImageVIew.h"
#import "ThemeManager.h"

@implementation ThemeImageVIew
//使用xib创建界面后，调用的初始化方法
- (void)awakeFromNib
{
    [super awakeFromNib];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(themeNotification:) name:kThemeDidChangeNofication object:nil];
}

- (id)initWithImageName:(NSString *)imageName
{
    self = [self init];
    if (self) {
        self.imageName = imageName;
    }
    return self;
}

- (id)init
{
    self = [super init];
    if (self) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(themeNotification:) name:kThemeDidChangeNofication object:nil];
    }
    return self;
}

- (void)setImageName:(NSString *)imageName
{
    if (_imageName != imageName) {
        [_imageName release];
        _imageName = [imageName copy];
    }
    [self loadThemeImage];
}

- (void)loadThemeImage
{
    if (self.imageName == nil) {
        return;
    }
    
    UIImage *image = [[ThemeManager shareInstantce] getThemeImage:self.imageName];
    self.image = image;
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:kThemeDidChangeNofication object:nil];
    [super dealloc];
}

- (void)themeNotification:(NSNotification *)notification
{
    [self loadThemeImage];
}

@end
