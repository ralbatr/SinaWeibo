//
//  UIFactory.m
//  Weibo
//
//  Created by Ralbatr on 13-10-23.
//  Copyright (c) 2013年 Ralbatr. All rights reserved.
//

#import "UIFactory.h"


@implementation UIFactory

+ (ThemeButton *)creatButton:(NSString *)imageName highted:(NSString *)hightedName
{
    ThemeButton *button = [[ThemeButton alloc] initWithImage:imageName highlightedImage:hightedName];
    return [button autorelease];
}
+ (ThemeButton *)creatButtonWithBackground:(NSString *)backgroundImageName backgroundHighted:(NSString *)backgroundHightName
{
    ThemeButton *button = [[ThemeButton alloc] initWithBackground:backgroundImageName backgroundHightImageName:backgroundHightName];
    return [button autorelease];
}

+ (ThemeImageVIew *)creatImageView:(NSString *)imageName
{
    ThemeImageVIew *themeImage = [[ThemeImageVIew alloc] initWithImageName:imageName];
    return [themeImage autorelease];
}

+ (ThemeLable *)creatLabel:(NSString *)colorName
{
    ThemeLable *themeLabel = [[ThemeLable alloc] initWithColorName:colorName];
    return [themeLabel autorelease];
}

@end
