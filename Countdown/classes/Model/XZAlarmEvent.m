//
//  XZAlarmEvent.m
//  Countdown
//
//  Created by Liang on 8/19/14.
//  Copyright (c) 2014 Xing Michael. All rights reserved.
//

#import "XZAlarmEvent.h"

@implementation XZAlarmEvent

- (instancetype)init:(NSString*)name
{
    self = [super init];
    if (self) {
        [self setEdit:[NSDate date] ];
        NSUUID *uid = [[NSUUID alloc] init];
        [self setUuid:[uid UUIDString]];
        [self setName:name];
    }
    return self;
}

-(void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.uuid forKey:@"uuid"];
    [aCoder encodeObject:self.name forKey:@"name"];
    [aCoder encodeObject:self.desc forKey:@"desc"];
    
    [aCoder encodeObject:self.edit forKey:@"edit"];
    [aCoder encodeObject:self.clock forKey:@"clock"];
    
}

-(id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    
    self.uuid = [aDecoder decodeObjectForKey:@"uuid"];
    self.name = [aDecoder decodeObjectForKey:@"name"];
    self.desc = [aDecoder decodeObjectForKey:@"desc"];
    self.edit = [aDecoder decodeObjectForKey:@"edit"];
    self.clock = [aDecoder decodeObjectForKey:@"clock"];
    
    return self;
}

@end
