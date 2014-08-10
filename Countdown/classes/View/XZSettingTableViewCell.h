//
//  XZSettingTableViewCell.h
//  Countdown
//
//  Created by Liang on 8/9/14.
//  Copyright (c) 2014 Xing Michael. All rights reserved.
//

#import <UIKit/UIKit.h>

extern NSString *const kSettingTableViewCell;

@interface XZSettingTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UISwitch *switchButton;
@property (weak, nonatomic) IBOutlet UILabel *labelTask;

@end
