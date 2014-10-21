//
//  XZ XZAlarmGroup.m
//  Countdown
//
//  Created by Liang on 14/10/21.
//  Copyright (c) 2014年 Xing Michael. All rights reserved.
//
#import "XZAlarmGroup.h"
#import "XZAlarmEvent.h"

@implementation XZAlarmGroup

- (instancetype)init:(NSString*)name
{
    self = [super init];
    if (self) {
        [self setUid:[[[NSUUID alloc] init] UUIDString]];
        [self setName:name];
        [self setPower:YES];
        self.alarms = [[NSMutableDictionary alloc] init];
    }
    return self;
}

- (void) addAlarm:(XZAlarmEvent *)alarm
{
    [self.alarms setObject:alarm forKey:alarm.uuid];
}

- (void) removeAlarm:(XZAlarmEvent *)alarm
{
    [self.alarms removeObjectForKey:alarm.uuid];
}

@end