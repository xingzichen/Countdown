//
//  XZAlarmEvent.m
//  Countdown
//
//  Created by Liang on 8/19/14.
//  Copyright (c) 2014 Xing Michael. All rights reserved.
//

#import "XZAlarmEvent.h"

@implementation XZAlarmEvent

@synthesize clock;
@synthesize edit;
@synthesize desc;
@synthesize name;
@synthesize power;

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setEdit:[[NSDate date] timeIntervalSince1970]*1000];
    }
    return self;
}

@end
