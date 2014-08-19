//
//  DataManager.h
//  Countdown
//
//  Created by Liang on 8/16/14.
//  Copyright (c) 2014 Xing Michael. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AlarmData.h"

@class DataManager;

@protocol DataManager <NSObject>

- (void)dataManager:(DataManager *)dataManager onTheGoWithError:(NSDictionary *)error;

@end

@interface DataManager : NSObject

@property (nonatomic, strong) AlarmData *alarmManager;

+ (DataManager *) sharedInstance;
- (void) saveData;

@end
