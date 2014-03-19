//
//  BaseViewController.h
//  Weibo
//
//  Created by Ralbatr on 13-10-7.
//  Copyright (c) 2013年 Ralbatr. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SinaWeibo.h"

@interface BaseViewController : UIViewController

@property (nonatomic,assign) BOOL isBackButton;

- (SinaWeibo *)sinaweibo;

@end
