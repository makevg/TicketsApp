//
//  MEScheduleVC.m
//  TicketsApp
//
//  Created by Максимычев Е.О. on 17.03.16.
//  Copyright © 2016 Maximychev Evgeny. All rights reserved.
//

#import "MEScheduleVC.h"
#import "MEScheduleView.h"
#import "MEStationsVC.h"
#import "MEStation.h"
#import "MEInputStationView.h"
#import "MEDatePickerVC.h"
#import "MEUtilsService.h"

@interface MEScheduleVC () <MEStationsVCDelegate, MEInputStationViewDelegate, MEDatePickerVCDelegate>
@property (strong, nonatomic) IBOutlet MEScheduleView *contentView;
@end

@implementation MEScheduleVC {
    MEStation *stationFrom;
    MEStation *stationTo;
    NSDate *selectedDate;
}

#pragma mark - Configure

- (void)configureController {
    self.contentView.stationFromView.delegate = self;
    self.contentView.stationToView.delegate = self;
}

#pragma mark - Private

- (void)showStationsByType:(MEStationsType)type {
    MEStationsVC *vc = (MEStationsVC *) [self loadControllerFromStoryboard:[MEStationsVC storyboardName]];
    vc.stationsType = type;
    vc.delegate = self;
    UINavigationController *navVC = [[UINavigationController alloc] initWithRootViewController:vc];
    [self.navigationController presentViewController:navVC animated:YES completion:nil];
}

- (void)showDatePicker {
    MEDatePickerVC *vc = (MEDatePickerVC *) [self loadControllerFromStoryboard:[MEDatePickerVC storyboardName]];
    vc.delegate = self;
    [vc setModalPresentationStyle:UIModalPresentationOverCurrentContext];
    [self presentViewController:vc animated:NO completion:nil];
}

- (void)checkFields {
    if (stationFrom && stationTo && selectedDate) {
        NSString *successMessage =
        [NSString stringWithFormat:@"From: %@, To: %@ at %@", stationFrom.stationTitle, stationTo.stationTitle, [MEUtilsService stringByDate:selectedDate]];
        [self showAlertWithTitle:@"Success" message:successMessage];
    } else {
        [self showAlertWithTitle:@"Error" message:@"Fill fields"];
    }
}

#pragma mark - Actions

- (IBAction)tappedDateLabel:(id)sender {
    [self showDatePicker];
}

- (IBAction)tappedBuyButton:(id)sender {
    [self checkFields];
}

#pragma mark - MEInputStationViewDelegate

- (void)tappedView:(MEInputStationView *)view {
    switch (view.type) {
        case MEInputStationViewTypeFrom:
            [self showStationsByType:MEStationsTypeFrom];
            break;
        case MEInputStationViewTypeTo:
            [self showStationsByType:MEStationsTypeTo];
            break;
    }
}

#pragma mark - MEStationsVCDelegate

- (void)controller:(MEStationsVC *)controller selectSation:(MEStation *)station {
    switch (controller.stationsType) {
        case MEStationsTypeFrom: {
            stationFrom = station;
            [self.contentView.stationFromView setStationTitle:station.stationTitle];
            break;
        }
        case MEStationsTypeTo: {
            stationTo = station;
            [self.contentView.stationToView setStationTitle:station.stationTitle];
            break;
        }
    }
}

#pragma mark - MEDatePickerVCDelegate

- (void)pickerController:(MEDatePickerVC *)controller selectDate:(NSDate *)date {
    selectedDate = date;
    [self.contentView setSelectedDate:date];
}

@end
