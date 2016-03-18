//
//  MEDatePickerVC.m
//  TicketsApp
//
//  Created by Максимычев Е.О. on 18.03.16.
//  Copyright © 2016 Maximychev Evgeny. All rights reserved.
//

#import "MEDatePickerVC.h"
#import "MEDatePickerView.h"

NSString *const cDatePickerStoryboardName = @"DatePicker";

@interface MEDatePickerVC ()
@property (strong, nonatomic) IBOutlet MEDatePickerView *contentView;
@end

@implementation MEDatePickerVC

#pragma mark - Lifecycle

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.contentView setMinDate:[NSDate date]];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - Public

+ (NSString *)storyboardName {
    return cDatePickerStoryboardName;
}

#pragma mark - Actions

- (IBAction)tappedCloseButton:(id)sender {
    if (self.delegate && [self.delegate respondsToSelector:@selector(closePickerController:)]) {
        [self.delegate closePickerController:self];
    }
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)tappedDoneButton:(id)sender {
    if (self.delegate && [self.delegate respondsToSelector:@selector(pickerController:selectDate:)]) {
        [self.delegate pickerController:self selectDate:[self.contentView getDate]];
    }
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
