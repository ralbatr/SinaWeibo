//
//  UIFactory.h
//  Weibo
//
//  Created by Ralbatr on 13-10-23.
//  Copyright (c) 2013年 Ralbatr. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ThemeButton.h"
#import "ThemeImageVIew.h"
#import "ThemeLable.h"

@interface UIFactory : NSObject

+ (ThemeButton *)creatButton:(NSString *)imageName highted:(NSString *)hightedName;
+ (ThemeButton *)creatButtonWithBackground:(NSString *)backgroundImageName backgroundHighted:(NSString *)backgroundHightName;
+ (ThemeImageVIew *)creatImageView:(NSString *)imageName;

+ (ThemeLable *)creatLabel:(NSString *)colorName;

@end
