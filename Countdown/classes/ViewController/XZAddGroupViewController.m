//
//  XZAddGroupViewController.m
//  Countdown
//
//  Created by Liang on 14/10/22.
//  Copyright (c) 2014年 Xing Michael. All rights reserved.
//

#import "XZAddGroupViewController.h"
#import "DataManager.h"
#import "XZAlarmGroup.h"

@interface XZAddGroupViewController ()

@end

@implementation XZAddGroupViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"时间安排";
    self.navigationController.navigationBar.translucent = NO;
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"完成" style:UIBarButtonItemStylePlain target:self action:@selector(finishPressed:)];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(cancelPressed:)];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - Navigation items pressed

- (IBAction)finishPressed:(id)sender {
    XZAlarmGroup *newGroup = [[XZAlarmGroup alloc] init:self.groupName.text];
    [[[DataManager sharedInstance] groups] setValue:newGroup forKey:[newGroup uid]];
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (IBAction)cancelPressed:(id)sender {
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}

@end
