//
//  MEScheduleView.h
//  TicketsApp
//
//  Created by Максимычев Е.О. on 18.03.16.
//  Copyright © 2016 Maximychev Evgeny. All rights reserved.
//

#import "MEBaseView.h"

@class MEInputStationView;

@interface MEScheduleView : MEBaseView

@property (weak, nonatomic) IBOutlet MEInputStationView *stationFromView;
@property (weak, nonatomic) IBOutlet MEInputStationView *stationToView;

- (void)setSelectedDate:(NSDate *)date;

@end
