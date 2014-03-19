//
//  ThemeLable.h
//  Weibo
//
//  Created by Ralbatr on 13-10-24.
//  Copyright (c) 2013年 Ralbatr. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ThemeLable : UILabel

@property (nonatomic,copy) NSString *colorName;

- (id)initWithColorName:(NSString *)colorName;

@end
