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

@property (nonatomic, strong)NSString *uid;
@property (nonatomic, strong)NSString *name;
@property (nonatomic, strong)NSString *desc;
@property (nonatomic, strong)NSMutableDictionary *alarms;
@property (nonatomic)BOOL power;

- (instancetype) init:(NSString *)name;
- (void) addAlarm:(XZAlarmEvent *)alarm;
- (void) removeAlarm:(XZAlarmEvent *)alarm;

@end
