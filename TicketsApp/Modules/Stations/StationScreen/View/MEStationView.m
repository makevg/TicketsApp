//
//  MEStationView.m
//  TicketsApp
//
//  Created by Максимычев Е.О. on 18.03.16.
//  Copyright © 2016 Maximychev Evgeny. All rights reserved.
//

#import "MEStationView.h"

@interface MEStationView ()
@property (weak, nonatomic) IBOutlet UILabel *stationLabel;
@property (weak, nonatomic) IBOutlet UILabel *countryLabel;
@property (weak, nonatomic) IBOutlet UILabel *districtLabel;
@property (weak, nonatomic) IBOutlet UILabel *cityLabel;
@property (weak, nonatomic) IBOutlet UILabel *regionLabel;
@end

@implementation MEStationView

#pragma mark - Setup

- (void)setup {
    [self setupColors];
    [self setupFonts];
}

- (void)setModel:(id)model {
    if ([model isKindOfClass:[MEStation class]]) {
        [self configureWithStation:model];
    }
}

#pragma mark - Private

- (void)setupColors {
    self.stationLabel.textColor = [MEStyle grayColor];
    self.countryLabel.textColor = [MEStyle grayColor];
    self.districtLabel.textColor = [MEStyle grayColor];
    self.cityLabel.textColor = [MEStyle grayColor];
    self.regionLabel.textColor = [MEStyle grayColor];
}

- (void)setupFonts {
    self.stationLabel.font = [MEStyle defaultFontOfSize:14.f];
    self.countryLabel.font = [MEStyle defaultFontOfSize:14.f];
    self.districtLabel.font = [MEStyle defaultFontOfSize:14.f];
    self.cityLabel.font = [MEStyle defaultFontOfSize:14.f];
    self.regionLabel.font = [MEStyle defaultFontOfSize:14.f];
}

- (void)configureWithStation:(MEStation *)station {
    self.stationLabel.text = station.stationTitle;
    self.countryLabel.text = station.countryTitle;
    self.districtLabel.text = station.districtTitle;
    self.cityLabel.text = station.cityTitle;
    self.regionLabel.text = station.regionTitle;
}

@end
