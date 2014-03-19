//
//  ThemeLable.m
//  Weibo
//
//  Created by Ralbatr on 13-10-24.
//  Copyright (c) 2013年 Ralbatr. All rights reserved.
//

#import "ThemeLable.h"
#import "ThemeManager.h"

@implementation ThemeLable

- (id)initWithColorName:(NSString *)colorName
{
    self = [self init];
    if (self) {
        self.colorName = colorName;
    }
    return self;
}

- (id)init
{
    self = [super init];
    if (self) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notification:) name:kThemeDidChangeNofication object:nil];
    }
    return self;
}

- (void)notification:(NSNotification *)notification
{
    [self setColor];
}

- (void)setColorName:(NSString *)colorName
{
    if (_colorName != colorName) {
        [_colorName release];
        _colorName = [colorName copy];
    }
    [self setColor];
}

- (void)setColor
{
    UIColor *textColor = [[ThemeManager shareInstantce] getColorWithName:_colorName];
    self.textColor = textColor;
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [super dealloc];
}

@end
