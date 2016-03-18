//
//  MEScheduleView.m
//  TicketsApp
//
//  Created by Максимычев Е.О. on 18.03.16.
//  Copyright © 2016 Maximychev Evgeny. All rights reserved.
//

#import "MEScheduleView.h"
#import "MEInputStationView.h"
#import "MEUtilsService.h"

@interface MEScheduleView ()
@property (weak, nonatomic) IBOutlet UILabel *fromLabel;
@property (weak, nonatomic) IBOutlet UILabel *toLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateValueLabel;
@end

@implementation MEScheduleView

#pragma mark - Setup

- (void)setup {
    self.fromLabel.font = [MEStyle defaultFontOfSize:14.f];
    self.toLabel.font = [MEStyle defaultFontOfSize:14.f];
    self.stationFromView.type = MEInputStationViewTypeFrom;
    self.stationToView.type = MEInputStationViewTypeTo;
    self.dateLabel.font = [MEStyle defaultFontOfSize:14.f];
    self.dateValueLabel.font = [MEStyle defaultFontOfSize:12.f];
    self.dateValueLabel.userInteractionEnabled = YES;
    self.dateValueLabel.text = @"Select date";
}

#pragma mark - Public

- (void)setSelectedDate:(NSDate *)date {
    self.dateValueLabel.text = [MEUtilsService stringByDate:date];
}

@end
