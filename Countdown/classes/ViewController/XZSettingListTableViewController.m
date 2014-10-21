//
//  XZSettingListTableViewController.m
//  Countdown
//
//  Created by Liang on 8/9/14.
//  Copyright (c) 2014 Xing Michael. All rights reserved.
//

#import "XZSettingListTableViewController.h"
#import "XZSettingTableViewCell.h"
#import "XZSettingGroupTableController.h"
#import "XZScheuleListViewController.h"

@interface XZSettingListTableViewController ()

@end

@implementation XZSettingListTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    
    self.navigationBar.translucent = NO;
    [self addChildViewController:[[XZSettingGroupTableController alloc] initWithNibName:@"XZSettingGroupTableController" bundle:nil]];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
