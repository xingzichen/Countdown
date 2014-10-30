//
//  XZDetailViewController.m
//  Countdown
//
//  Created by Liang on 8/10/14.
//  Copyright (c) 2014 Xing Michael. All rights reserved.
//

#import "XZDetailViewController.h"
#import "XZAlarmGroup.h"
#import "DataManager.h"

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
    self.textEventName.delegate = self;
    self.textEventTime.delegate = self;
    
    if (self.alarmEvent) {
        self.datepicker.date = self.alarmEvent.clock;
        self.textEventName.text = self.alarmEvent.name;
        self.textEventTime.text = [self.fmt stringFromDate:self.alarmEvent.clock];
    }
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
    
    if (self.alarmEvent == nil) {
        self.alarmEvent = [[XZAlarmEvent alloc] init:self.textEventName.text];
        [self.alarmEvent setClock:self.datepicker.date];
        [[[[DataManager sharedInstance] groups] valueForKey:self.groupKey] addAlarm:self.alarmEvent];
    }else{
        [self.alarmEvent setName:self.textEventName.text];
        [self.alarmEvent setClock:self.datepicker.date];
        [self.alarmEvent setEdit:[NSDate date]];
    }
    
    
    
    [self.navigationController popViewControllerAnimated:YES];
    
}


- (IBAction)cancelPressed:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (BOOL) textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return  YES;
}

@end
