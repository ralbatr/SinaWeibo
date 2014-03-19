//
//  ThemeButton.h
//  Weibo
//
//  Created by Ralbatr on 13-10-21.
//  Copyright (c) 2013年 Ralbatr. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ThemeButton : UIButton

@property (nonatomic,copy) NSString *imageName;
@property (nonatomic,copy) NSString *highlightImageName;

@property (nonatomic,copy) NSString *backgroundImageName;
@property (nonatomic,copy) NSString *backgroundHightImageName;


- (id)initWithImage:(NSString *)imageName highlightedImage:(NSString *)highlightedImageName;
- (id)initWithBackground:(NSString *)backgroundImageName
    backgroundHightImageName:(NSString *)backgroundHightImageName;


@end
