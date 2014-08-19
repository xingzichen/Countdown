//
//  AlarmData.h
//  Countdown
//
//  Created by Liang on 8/18/14.
//  Copyright (c) 2014 Xing Michael. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AlarmData : NSObject

@property (nonatomic,strong) NSDictionary *alarms;

- (void) saveData;

@end
