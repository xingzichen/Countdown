//
//  DataManager.m
//  Countdown
//
//  Created by Liang on 8/16/14.
//  Copyright (c) 2014 Xing Michael. All rights reserved.
//

#import "DataManager.h"
#import "XZAlarmGroup.h"

static DataManager *_sharedInstance = nil;

@interface DataManager()

@property (nonatomic,strong) NSString *dictionaryPath;

@end

@implementation DataManager {
    
}

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
        self.dictionaryPath = [NSSearchPathForDirectoriesInDomains(NSDocumentationDirectory, NSUserDomainMask, YES) objectAtIndex:0];
        [self loadData];
    }
    return self;
}

- (NSMutableDictionary *)loadGroupsData{
    NSMutableDictionary *markers = nil;
    NSString *filePath = [self.dictionaryPath stringByAppendingString:kAlarmFileName];
    NSLog(@" file path = %@", filePath);
    if (filePath == nil || [filePath length] == 0 ||
        [[NSFileManager defaultManager] fileExistsAtPath:filePath] == NO) {
        markers = [[NSMutableDictionary alloc] init];
    } else {
        NSData *data = [[NSData alloc] initWithContentsOfFile:filePath];
        NSKeyedUnarchiver *vdUnarchiver = [[NSKeyedUnarchiver alloc] initForReadingWithData:data];
        markers = [vdUnarchiver decodeObjectForKey:@"groups"];
        [vdUnarchiver finishDecoding];
    }
    return markers;
    
}

- (void)saveGroupData:(NSMutableDictionary *)markers {
    NSMutableData *data = [[NSMutableData alloc] init];
    NSString *filePath = [self.dictionaryPath stringByAppendingString:kAlarmFileName];
    NSKeyedArchiver *vdArchiver = [[NSKeyedArchiver alloc] initForWritingWithMutableData:data];
    [vdArchiver encodeObject:markers forKey:@"groups"];
    [vdArchiver finishEncoding];
    BOOL ret = [data writeToFile:filePath atomically:YES];
    NSLog(@"write data = %@", ret?@"YES":@"NO");
}


- (void) saveData {
    [self saveGroupData:self.groups];
}

- (void) loadData {
    self.groups = [self loadGroupsData];
}

@end
