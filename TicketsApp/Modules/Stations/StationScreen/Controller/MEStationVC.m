//
//  MEStationVC.m
//  TicketsApp
//
//  Created by Максимычев Е.О. on 18.03.16.
//  Copyright © 2016 Maximychev Evgeny. All rights reserved.
//

#import "MEStationVC.h"
#import "MEStationView.h"

@interface MEStationVC ()
@property (strong, nonatomic) IBOutlet MEStationView *contentView;
@end

@implementation MEStationVC

#pragma mark - Configure

- (void)configureController {
    [self setTitle:self.station.stationTitle];
    [self.contentView setModel:self.station];
}

@end
