//
//  XZCountViewController.h
//  Countdown
//
//  Created by Liang on 8/9/14.
//  Copyright (c) 2014 Xing Michael. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XZCountViewController : UIViewController

@property (nonatomic) UINavigationController *parentNavigationController;
@property (weak, nonatomic) IBOutlet UILabel *labelEventName;
@property (weak, nonatomic) IBOutlet UILabel *labelClock;

@end
