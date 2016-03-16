//
//  MECity.h
//  TicketsApp
//
//  Created by Maximychev Evgeny on 16.03.16.
//  Copyright © 2016 Maximychev Evgeny. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MECityLocation.h"
#import "MEStation.h"

@interface MECity : NSObject

@property (nonatomic) NSString *countryTitle;
@property (nonatomic) MECityLocation *point;
@property (nonatomic) NSString *districtTitle;
@property (nonatomic) NSNumber *cityId;
@property (nonatomic) NSString *cityTitle;
@property (nonatomic) NSString *regionTitle;
@property (nonatomic) NSArray<MEStation *> *stations;

@end
