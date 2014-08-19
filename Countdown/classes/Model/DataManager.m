//
//  DataManager.m
//  Countdown
//
//  Created by Liang on 8/16/14.
//  Copyright (c) 2014 Xing Michael. All rights reserved.
//

#import "DataManager.h"

static DataManager *_sharedInstance = nil;

@implementation DataManager

+ (DataManager *)sharedInstance{
    @synchronized (self){
        if (!_sharedInstance) {
            _sharedInstance = [[DataManager alloc] init];
        }
    }
    return _sharedInstance;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        if (!_alarmManager) {
            _alarmManager = [[AlarmData alloc] init];
        }
    }
    return self;
}

- (AlarmData *)alarmManager{
    if (!_alarmManager) {
        _alarmManager = [[AlarmData alloc] init];
    }
    return _alarmManager;
}

- (void) saveData{
    [[self alarmManager] saveData];
}

@end
