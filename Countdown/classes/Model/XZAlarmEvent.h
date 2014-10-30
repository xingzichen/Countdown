//
//  XZAlarmEvent.h
//  Countdown
//
//  Created by Liang on 8/19/14.
//  Copyright (c) 2014 Xing Michael. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XZAlarmEvent : NSObject<NSCoding>

@property (nonatomic, strong) NSDate *edit;
@property (nonatomic, strong) NSDate *clock;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *desc;
@property (nonatomic, strong) NSString *uuid;

-(instancetype) init:(NSString *)name;

@end
