//
//  ThemeButton.m
//  Weibo
//
//  Created by Ralbatr on 13-10-21.
//  Copyright (c) 2013年 Ralbatr. All rights reserved.
//

#import "ThemeButton.h"
#import "ThemeManager.h"

@implementation ThemeButton


- (id)initWithImage:(NSString *)imageName highlightedImage:(NSString *)highlightedImageName
{
    self = [self init];
    if (self) {
        self.imageName = imageName;
        self.highlightImageName = highlightedImageName;
    }
    return self;
}


- (id)initWithBackground:(NSString *)backgroundImageName
backgroundHightImageName:(NSString *)backgroundHightImageName
{
    self = [self init];
    if (self) {
        self.backgroundImageName = backgroundImageName;
        self.backgroundHightImageName = backgroundHightImageName;
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

- (void)themeNotification:(NSNotification *)notification
{
    [self loadImage];
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [super dealloc];
}

- (void)loadImage
{
    ThemeManager *themeManager = [ThemeManager shareInstantce];
    
    UIImage *image = [themeManager getThemeImage:_imageName];
    UIImage *hightlightimage = [themeManager getThemeImage:_highlightImageName];
    
    [self setImage:image forState:UIControlStateNormal];
    [self setImage:hightlightimage forState:UIControlStateHighlighted];

    UIImage *backImage = [themeManager getThemeImage:_backgroundImageName];
    UIImage *backHightlightimage = [themeManager getThemeImage:_backgroundHightImageName];
    
    [self setBackgroundImage:backImage forState:UIControlStateNormal];
    [self setBackgroundImage:backHightlightimage forState:UIControlStateHighlighted];
}
#pragma mark - setter
- (void)setImageName:(NSString *)imageName
{
    if (_imageName != imageName) {
        [_imageName release];
        _imageName = imageName;
    }
    [self loadImage];
}

- (void)setHighlightImageName:(NSString *)highlightImageName
{
    if (_highlightImageName != highlightImageName) {
        [_highlightImageName release];
        _highlightImageName = highlightImageName;
    }
    [self loadImage];
}

- (void)setBackgroundImageName:(NSString *)backgroundImageName
{
    if (_backgroundImageName != backgroundImageName) {
        [_highlightImageName release];
        _highlightImageName = backgroundImageName;
    }
    [self loadImage];
}

- (void)setBackgroundHightImageName:(NSString *)backgroundHightImageName
{
    if (_backgroundHightImageName != backgroundHightImageName) {
        [_highlightImageName release];
        _backgroundHightImageName = backgroundHightImageName;
    }
    [self loadImage];
}

@end
