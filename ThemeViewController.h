//
//  ThemeViewController.h
//  Weibo
//
//  Created by Ralbatr on 13-10-21.
//  Copyright (c) 2013年 Ralbatr. All rights reserved.
//

#import "BaseViewController.h"

@interface ThemeViewController : BaseViewController <UITableViewDelegate,UITableViewDataSource>
{
    NSArray *themes;
}

@property (retain, nonatomic) IBOutlet UITableView *tableView;
@end
