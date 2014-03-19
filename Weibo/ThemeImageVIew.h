//
//  ThemeImageVIew.h
//  Weibo
//
//  Created by Ralbatr on 13-10-24.
//  Copyright (c) 2013年 Ralbatr. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ThemeImageVIew : UIImageView

@property (nonatomic,copy) NSString *imageName;

- (id)initWithImageName:(NSString *)imageName;

@end
