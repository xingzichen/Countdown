//
//  XZMainViewController.m
//  Countdown
//
//  Created by Liang on 8/9/14.
//  Copyright (c) 2014 Xing Michael. All rights reserved.
//

#import "XZMainViewController.h"
#import "XZAddGroupViewController.h"
#import "XZBaseViewController.h"

@interface XZMainViewController () <UITabBarDelegate>

@end

@implementation XZMainViewController {
    UITabBarItem *currentItem;
    NSMutableDictionary *viewCache;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    viewCache = [[NSMutableDictionary alloc] init];
    
    
    self.tabBar.delegate = self;
    [self.tabBar setSelectedItem:self.settingItem];
    [self loadContent:self.settingItem];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)loadContent:(UITabBarItem *)item {
    
    NSString *contentClassName = nil;
    if (item == self.countItem) {
        contentClassName = @"XZCountViewController";
    }
    else if (item == self.settingItem) {
        contentClassName = @"XZSettingGroupTableController";
        [self.navigationItem setRightBarButtonItem:[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addNewScheuleGroup:)]];
        
        [self.navigationItem setLeftBarButtonItem:[[UIBarButtonItem alloc] initWithTitle:@"编辑" style:UIBarButtonItemStylePlain target:self action:@selector(editScheuleGroup:)]];
    }
    
    self.title = item.title;
    
    [self addSubViewControllerByName:contentClassName];
    
}

- (void)addSubViewControllerByName:(NSString *)className {
    XZBaseViewController *vc = [viewCache objectForKey:className];
    if (!vc) {
        Class vcClass = NSClassFromString(className);
        vc = [[vcClass alloc] initWithNibName:className bundle:nil];
        if (vc) {
            [viewCache setObject:vc forKey:className];
        }
    }
    
    vc.view.frame = _containerView.bounds;
    vc.parentNavigationController = self.navigationController;
    [_containerView addSubview:vc.view];
}

-(void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item{
    if (currentItem == item) {
        return;
    }
    
    currentItem = item;
    [tabBar setSelectedItem:item];
    [self loadContent:item];
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
