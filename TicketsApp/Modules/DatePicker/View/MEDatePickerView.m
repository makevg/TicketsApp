//
//  MEDatePickerView.m
//  TicketsApp
//
//  Created by Максимычев Е.О. on 18.03.16.
//  Copyright © 2016 Maximychev Evgeny. All rights reserved.
//

#import "MEDatePickerView.h"

@interface MEDatePickerView ()
@property (weak, nonatomic) IBOutlet UIView *contentView;
@property (weak, nonatomic) IBOutlet UIView *titleView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;
@end

@implementation MEDatePickerView

#pragma mark - Setup

- (void)setup {
    self.contentView.layer.cornerRadius = 5.f;
    self.contentView.clipsToBounds = YES;
    self.titleView.backgroundColor = [MEStyle blueColor];
    self.titleLabel.textColor = [MEStyle whiteColor];
    self.titleLabel.font = [MEStyle defaultFontOfSize:18.f];
    self.datePicker.datePickerMode = UIDatePickerModeDate;
}

#pragma mark - Public

- (void)setMinDate:(NSDate *)date {
    self.datePicker.minimumDate = date;
}

- (NSDate *)getDate {
    return self.datePicker.date;
}

@end
