//
//  XZDetailViewController.h
//  Countdown
//
//  Created by Liang on 8/10/14.
//  Copyright (c) 2014 Xing Michael. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XZAlarmEvent.h"

@interface XZDetailViewController : UIViewController

@property (nonatomic) NSString *mode;
@property (nonatomic) XZAlarmEvent *alarmEvent;
@property (weak, nonatomic) IBOutlet UITextField *textEventName;
@property (weak, nonatomic) IBOutlet UITextField *textEventTime;
@property (weak, nonatomic) IBOutlet UIDatePicker *datepicker;

@end
