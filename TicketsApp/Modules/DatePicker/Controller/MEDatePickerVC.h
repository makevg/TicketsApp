//
//  MEDatePickerVC.h
//  TicketsApp
//
//  Created by Максимычев Е.О. on 18.03.16.
//  Copyright © 2016 Maximychev Evgeny. All rights reserved.
//

#import "MEBaseVC.h"

@protocol MEDatePickerVCDelegate;

@interface MEDatePickerVC : MEBaseVC

@property (weak, nonatomic) id<MEDatePickerVCDelegate> delegate;

@end

@protocol MEDatePickerVCDelegate <NSObject>

@required
- (void)pickerController:(MEDatePickerVC *)controller selectDate:(NSDate *)date;

@optional
- (void)closePickerController:(MEDatePickerVC *)controller;

@end