//
//  XZDetailViewController.m
//  Countdown
//
//  Created by Liang on 8/10/14.
//  Copyright (c) 2014 Xing Michael. All rights reserved.
//

#import "XZDetailViewController.h"

@interface XZDetailViewController ()

@property (nonatomic) NSDateFormatter *fmt;

@end

@implementation XZDetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.fmt = [[NSDateFormatter alloc] init];
        self.fmt.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"];
        self.fmt.dateFormat = @"HH:mm";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    NSDate *now = self.datepicker.date = [NSDate date];
    [self.textEventTime setText:[self.fmt stringFromDate:now]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)datepickerChanged:(id)sender {
    
    UIDatePicker *dp = sender;
    NSDate *date = dp.date;
    
    self.textEventTime.text = [self.fmt stringFromDate:date];
}

- (IBAction)confirmPressed:(id)sender {
    
    if ([self.textEventName.text  isEqual: @""]) {
        return;
    }
    
    if (self.alarmEvent) {
        self.alarmEvent = [[XZAlarmEvent alloc] init:self.textEventName.text];
        [self.alarmEvent setClock:self.datepicker.date];
    }
    
    [self.navigationController popViewControllerAnimated:YES];
    
}


- (IBAction)cancelPressed:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
}

@end
