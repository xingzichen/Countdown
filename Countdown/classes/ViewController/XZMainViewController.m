//
//  XZMainViewController.m
//  Countdown
//
//  Created by Liang on 8/9/14.
//  Copyright (c) 2014 Xing Michael. All rights reserved.
//

#import "XZMainViewController.h"

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
        contentClassName = @"XZSettingListTableViewController";
    }
    
    self.title = item.title;
    
    [self addSubViewControllerByName:contentClassName];
    
}

- (void)addSubViewControllerByName:(NSString *)className {
    UIViewController *vc = [viewCache objectForKey:className];
    if (!vc) {
        Class vcClass = NSClassFromString(className);
        vc = [[vcClass alloc] initWithNibName:className bundle:nil];
        if (vc) {
            [viewCache setObject:vc forKey:className];
        }
    }
    
    vc.view.frame = _containerView.bounds;
    
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


@end
