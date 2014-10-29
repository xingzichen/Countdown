//
//  XZAlarmGroup.h
//  Countdown
//
//  Created by Liang on 14/10/21.
//  Copyright (c) 2014年 Xing Michael. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "XZAlarmEvent.h"

extern NSString *const kAlarmFileName;

@interface XZAlarmGroup : NSObject<NSCoding>

@property (nonatomic)NSString *uid;
@property (nonatomic)NSString *name;
@property (nonatomic)NSString *desc;
@property (nonatomic)NSMutableDictionary *alarms;
@property (nonatomic)BOOL power;

- (instancetype) init:(NSString *)name;
- (void) addAlarm:(XZAlarmEvent *)alarm;
- (void) removeAlarm:(XZAlarmEvent *)alarm;

@end
