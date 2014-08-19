//
//  AlarmData.m
//  Countdown
//
//  Created by Liang on 8/18/14.
//  Copyright (c) 2014 Xing Michael. All rights reserved.
//

#import "AlarmData.h"

@implementation AlarmData : NSObject

- (void) saveData {
    NSUserDefaults *usrdefaults = [NSUserDefaults standardUserDefaults];
    
    [usrdefaults setObject:_alarms forKey:@"alarms"];
}

- (void) loadData {
    NSUserDefaults *usrdefaults = [NSUserDefaults standardUserDefaults];
    
    _alarms = [usrdefaults dictionaryForKey:@"alarms"];
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self loadData];
        if (!_alarms) {
            _alarms = [[NSDictionary alloc] init];
        }
    }
    return self;
}

@end
