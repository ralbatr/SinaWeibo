//
//  AppDelegate.h
//  Weibo
//
//  Created by Ralbatr on 13-10-7.
//  Copyright (c) 2013年 Ralbatr. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MainViewController;
@class SinaWeibo;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic,retain) SinaWeibo *sinaWeibo;
@property (nonatomic,retain) MainViewController *mainCtrl;

@end
