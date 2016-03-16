//
//  MECityLocation.m
//  TicketsApp
//
//  Created by Maximychev Evgeny on 16.03.16.
//  Copyright © 2016 Maximychev Evgeny. All rights reserved.
//

#import "MECityLocation.h"

@implementation MECityLocation

#pragma mark - Init

- (instancetype)initWithLongitude:(double)longitude latitude:(double)latitude {
    self = [super init];
    if (self) {
        _longitude = longitude;
        _latitude  = latitude;
    }
    return self;
}

@end
