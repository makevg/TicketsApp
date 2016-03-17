//
//  MELocation.m
//  TicketsApp
//
//  Created by Максимычев Е.О. on 17.03.16.
//  Copyright © 2016 Maximychev Evgeny. All rights reserved.
//

#import "MELocation.h"

@implementation MELocation

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
