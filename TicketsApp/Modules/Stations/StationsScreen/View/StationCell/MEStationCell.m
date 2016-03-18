//
//  MEStationCell.m
//  TicketsApp
//
//  Created by Максимычев Е.О. on 17.03.16.
//  Copyright © 2016 Maximychev Evgeny. All rights reserved.
//

#import "MEStationCell.h"
#import "MEStation.h"

@interface MEStationCell ()
@property (weak, nonatomic) IBOutlet UILabel *stationNameLabel;
@end

@implementation MEStationCell

#pragma mark - Public

- (void)configureCell {
    self.stationNameLabel.font = [MEStyle defaultFontOfSize:14.f];
    self.stationNameLabel.textColor = [MEStyle grayColor];
}

- (void)setModel:(id)model {
    if ([model isKindOfClass:[MEStation class]]) {
        [self configureCellWithStation:model];
    }
}

#pragma mark - Private

- (void)configureCellWithStation:(MEStation *)station {
    self.stationNameLabel.text = station.stationTitle;
}

@end
