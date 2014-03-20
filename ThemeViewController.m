//
//  ThemeViewController.m
//  Weibo
//
//  Created by Ralbatr on 13-10-21.
//  Copyright (c) 2013年 Ralbatr. All rights reserved.
//

#import "ThemeViewController.h"
#import "ThemeManager.h"
#import "UIFactory.h"

@interface ThemeViewController ()

@end

@implementation ThemeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        themes = [[ThemeManager shareInstantce].themesPlist allKeys];
        [themes retain];
        
        self.title = @"主题切换";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [_tableView release];
    [super dealloc];
}

#pragma mark - UITableView delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return  themes.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *idntify = @"themeCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:idntify];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:idntify] autorelease];
        UILabel *textLabel = [UIFactory creatLabel:kThemeListLabel];
        textLabel.frame = CGRectMake(10, 10, 200, 30);
        textLabel.backgroundColor = [UIColor clearColor];
        textLabel.font = [UIFont boldSystemFontOfSize:16.0f];
        textLabel.tag = 2013;
        [cell.contentView addSubview:textLabel];
    }
//    cell.textLabel.text = themes[indexPath.row];
    UILabel *textLabel = (UILabel *)[cell.contentView viewWithTag:2013];
    textLabel.text = themes[indexPath.row];
    
    return  cell;
}
// 切换主题
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *themeName = themes[indexPath.row];
    
    if ([themeName isEqualToString:@"默认"]) {
        themeName = nil;
    }
    [ThemeManager shareInstantce].themeName = themeName;
    [[NSNotificationCenter defaultCenter] postNotificationName:kThemeDidChangeNofication object:themeName];
}

@end
