//
//  XZScheuleListViewController.m
//  Countdown
//
//  Created by Liang on 8/10/14.
//  Copyright (c) 2014 Xing Michael. All rights reserved.
//

#import "XZScheuleListViewController.h"
#import "XZDetailViewController.h"
#import "XZScheuleTableViewCell.h"
#import "XZAddScheuleTableViewCell.h"
#import "XZAlarmEvent.h"
#import "DataManager.h"

@interface XZScheuleListViewController ()

@end

@implementation XZScheuleListViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    self.title = @"时间设置";
    
    [self.navigationItem setRightBarButtonItem:[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCamera target:self action:@selector(addNewScheuleGroup:)]];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"XZScheuleTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:kScheuleTableViewCell];
    [self.tableView registerNib:[UINib nibWithNibName:@"XZAddScheuleTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:kAddScheuleTableViewCell];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    [[self tableView] reloadData];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    if (section!=0) {
        return 1;
    }
    return [self.group.alarms count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"section : %ld", (long)indexPath.section);
    if(indexPath.section != 0){
        //return [[XZAddScheuleTableViewCell alloc] init];
        XZAddScheuleTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kAddScheuleTableViewCell forIndexPath:indexPath];
        return  cell;
    }
    
    XZScheuleTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kScheuleTableViewCell forIndexPath:indexPath];
    
    // Configure the cell...
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    fmt.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"];
    fmt.dateFormat = @"HH:mm";
    
    XZAlarmEvent *alarm = [self.group.alarms.allValues objectAtIndex:indexPath.row];
    cell.textEvent.text = [alarm name];
    cell.textTime.text = [fmt stringFromDate:[alarm clock]];
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
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
    XZDetailViewController *detailViewController = [[XZDetailViewController alloc] initWithNibName:@"XZDetailViewController" bundle:nil];
    
    // Pass the selected object to the new view controller.
    if (indexPath.section != 0) {
        detailViewController.title = @"添加事件";
        detailViewController.groupKey = [self.group uid];
        detailViewController.alarmEvent = nil;
    }
    else{
        detailViewController.title = @"编辑事件";
        detailViewController.alarmEvent = [[self.group alarms] valueForKey:[[[self.group alarms] allKeys] objectAtIndex:indexPath.row]];
    }
    
    // Push the view controller.
    [self.navigationController pushViewController:detailViewController animated:YES];
}



- (IBAction)addNewScheuleGroup:(id)sender
{
    // add a new scheule group
    
}
@end
