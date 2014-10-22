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
        [self loadData];
    }
    return self;
}

- (void) saveGroupData {
    NSUserDefaults *usrdefaults = [NSUserDefaults standardUserDefaults];
    
    [usrdefaults setObject:[NSKeyedArchiver archivedDataWithRootObject:_groups] forKey:@"groups"];
}

- (void) loadGroupsData {
    NSUserDefaults *usrdefaults = [NSUserDefaults standardUserDefaults];
    NSData *dat = [usrdefaults valueForKey:@"groups"];
    _groups = [[NSKeyedUnarchiver unarchiveObjectWithData:dat] mutableCopy];
    if (_groups==nil) {
        _groups = [[NSMutableDictionary alloc] init];
    }
}


- (void) saveData {
    [self saveGroupData];
}

- (void) loadData {
    [self loadGroupsData];
}

@end
