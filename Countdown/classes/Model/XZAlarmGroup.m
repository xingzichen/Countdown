//
//  XZ XZAlarmGroup.m
//  Countdown
//
//  Created by Liang on 14/10/21.
//  Copyright (c) 2014年 Xing Michael. All rights reserved.
//
#import "XZAlarmGroup.h"


NSString *const kAlarmFileName = @"XZAlarms.plist";

@interface XZAlarmGroup()

//@property (nonatomic) NSString *dictionaryPath;

@end

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

-(void) encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:self.uid forKey:@"uid"];
    [aCoder encodeObject:self.name forKey:@"name"];
    [aCoder encodeObject:self.desc forKey:@"desc"];
    [aCoder encodeBool:self.power forKey:@"power"];
//    [aCoder encodeDataObject:self.alarms]
//    [aCoder encodeObject:self.power?@"YES":@"NO" forKey:@"power"];
    [self saveAlarmsData:self.alarms];
    NSLog(@"save alarms for group : %@ , alarms num : %lu", self.uid, (unsigned long)[self.alarms count]);
}

-(id) initWithCoder:(NSCoder *)aDecoder {
    if (self = [super init]) {
        self.uid = [aDecoder decodeObjectForKey:@"uid"];
        self.name = [aDecoder decodeObjectForKey:@"name"];
        self.desc = [aDecoder decodeObjectForKey:@"desc"];
        self.power = [aDecoder decodeBoolForKey:@"power"];
        self.alarms = [self loadAlarmsData];
        NSLog(@"load alarms");
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

- (NSMutableDictionary *)loadAlarmsData{
    NSMutableDictionary *markers = nil;
    NSString *filePath = [[NSSearchPathForDirectoriesInDomains(NSDocumentationDirectory, NSUserDomainMask, YES) objectAtIndex:0] stringByAppendingString:[self.uid stringByAppendingString:@".plist"]];
    NSLog(@"read alarm file path = %@", filePath);
    if (filePath == nil || [filePath length] == 0 ||
        [[NSFileManager defaultManager] fileExistsAtPath:filePath] == NO) {
        markers = [[NSMutableDictionary alloc] init];
    } else {
        NSData *data = [[NSData alloc] initWithContentsOfFile:filePath];
        NSKeyedUnarchiver *vdUnarchiver = [[NSKeyedUnarchiver alloc] initForReadingWithData:data];
        markers = [vdUnarchiver decodeObjectForKey:self.uid];
        [vdUnarchiver finishDecoding];
    }
    return markers;
    
}

- (void)saveAlarmsData:(NSMutableDictionary *)markers {
    NSMutableData *data = [[NSMutableData alloc] init];
    NSString *filePath = [[NSSearchPathForDirectoriesInDomains(NSDocumentationDirectory, NSUserDomainMask, YES) objectAtIndex:0] stringByAppendingString:[self.uid stringByAppendingString:@".plist"]];
    NSKeyedArchiver *vdArchiver = [[NSKeyedArchiver alloc] initForWritingWithMutableData:data];
    [vdArchiver encodeObject:markers forKey:self.uid];
    [vdArchiver finishEncoding];
    BOOL ret = [data writeToFile:filePath atomically:YES];
    NSLog(@"write alarm file path = %@ ", filePath);
    NSLog(@"write alarm data = %@", ret?@"YES":@"NO");
}

@end