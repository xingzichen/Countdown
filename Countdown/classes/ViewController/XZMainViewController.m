//
//  XZMainViewController.m
//  Countdown
//
//  Created by Liang on 8/9/14.
//  Copyright (c) 2014 Xing Michael. All rights reserved.
//

#import "XZMainViewController.h"
#import "XZBaseViewController.h"

@interface XZMainViewController () <UITabBarDelegate>

@end

@implementation XZMainViewController {
    UIView *containerView;
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
    
    CGRect containerFrame = CGRectMake(0, 0, self.view.frame.size.width, 0);
    if ([[[UIDevice currentDevice] systemVersion] integerValue] >= 7) {
        containerFrame.origin.y = 64;
    }
    containerFrame.size.height = self.view.frame.size.height - containerFrame.origin.y - self.tabBar.frame.size.height;
    
    containerView = [[UIView alloc] initWithFrame:containerFrame];
    containerView.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    [self.view addSubview:containerView];
    
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
        contentClassName = @"XZSettingListTableViewController";
    }
    
    
    [self addSubViewControllerByName:contentClassName];
    self.title = item.title;
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
    
    vc.view.frame = containerView.bounds;
    
    vc.parentNavigationController = self.navigationController;
    [containerView addSubview:vc.view];
}

-(void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item{
    if (currentItem == item) {
        return;
    }
    
    currentItem = item;
    [tabBar setSelectedItem:item];
    [self loadContent:item];
}


@end
