//
//  XZSettingGroupTableController.m
//  Countdown
//
//  Created by Liang on 14/10/21.
//  Copyright (c) 2014年 Xing Michael. All rights reserved.
//

#import "XZSettingGroupTableController.h"
#import "XZSettingTableViewCell.h"
#import "XZScheuleListViewController.h"
#import "XZAddGroupViewController.h"
#import "XZAlarmGroup.h"
#import "DataManager.h"

@interface XZSettingGroupTableController ()

@end

@implementation XZSettingGroupTableController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    self.title = @"时间方案";
    
    [self.tableView registerNib:[UINib nibWithNibName:@"XZSettingTableViewCell" bundle:nil] forCellReuseIdentifier:kSettingTableViewCell];
    
    [self.navigationItem setRightBarButtonItem:[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addNewScheuleGroup:)]];
    
    [self.navigationItem setLeftBarButtonItem:[[UIBarButtonItem alloc] initWithTitle:@"编辑" style:UIBarButtonItemStylePlain target:self action:@selector(editScheuleGroup:)]];
    
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 100;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    [[self tableView] reloadData];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    NSInteger numberOfRow = [[[DataManager sharedInstance] groups] count];
    return numberOfRow;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    XZSettingTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kSettingTableViewCell forIndexPath:indexPath];
    
    // Configure the cell...
    NSArray *values = [[DataManager sharedInstance] groups].allValues;
    XZAlarmGroup *group = [values objectAtIndex:indexPath.row];
    cell.labelTask.text = [group name];
    
    NSLog(@"section = %ld, group uid : %@ , name = %@", indexPath.section, group.uid, group.name);
    
    return cell;
}


// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}



// Override to support editing the table view.
//- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
//    if (editingStyle == UITableViewCellEditingStyleDelete) {
//        // Delete the row from the data source
//        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
//    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
//        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
//    }   
//}


/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here, for example:
    // Create the next view controller.
    XZScheuleListViewController *scheuleViewController = [[XZScheuleListViewController alloc] initWithNibName:@"XZScheuleListViewController" bundle:nil];
    
    // Pass the selected object to the new view controller.
    scheuleViewController.title = @"修改事件";
    scheuleViewController.group = [[[DataManager sharedInstance] groups].allValues objectAtIndex:indexPath.row];
    
    // Push the view controller.
    [self.navigationController pushViewController:scheuleViewController animated:YES];
}


#pragma mark - Bar Button Actions

- (IBAction)addNewScheuleGroup:(id)sender
{
    // add a new scheule group
    NSLog(@"addNewScheuleGroup");
    XZAddGroupViewController *addGroupController = [[XZAddGroupViewController alloc] initWithNibName:@"XZAddGroupViewController" bundle:nil];
    UINavigationController *navi = [[UINavigationController alloc] initWithRootViewController:addGroupController];
    [self.navigationController presentViewController:navi animated:YES completion:nil];
}

- (IBAction)editScheuleGroup:(id)sender
{
    // delete scheule group
    NSLog(@"deleteScheuleGroup");
}


@end
