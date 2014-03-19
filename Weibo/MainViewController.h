//
//  MainViewController.h
//  Weibo
//
//  Created by Ralbatr on 13-10-7.
//  Copyright (c) 2013年 Ralbatr. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SinaWeibo.h"

@interface MainViewController : UITabBarController <SinaWeiboDelegate>
{
    UIView *_tabbarView;
}

//@property

@end
