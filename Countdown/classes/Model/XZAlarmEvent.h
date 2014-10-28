//
//  XZAlarmEvent.h
//  Countdown
//
//  Created by Liang on 8/19/14.
//  Copyright (c) 2014 Xing Michael. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XZAlarmEvent : NSObject<NSCoding>

@property (nonatomic) NSDate *edit;
@property (nonatomic) NSDate *clock;
@property (nonatomic) NSString *name;
@property (nonatomic) NSString *desc;
@property (nonatomic) NSString *uuid;

-(instancetype) init:(NSString *)name;

@end
