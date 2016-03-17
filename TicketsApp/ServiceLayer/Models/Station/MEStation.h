//
//  MEStation.h
//  TicketsApp
//
//  Created by Maximychev Evgeny on 16.03.16.
//  Copyright © 2016 Maximychev Evgeny. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MELocation.h"

@interface MEStation : NSObject

@property (nonatomic) NSString *countryTitle;
@property (nonatomic) MELocation *point;
@property (nonatomic) NSString *districtTitle;
@property (nonatomic) NSNumber *cityId;
@property (nonatomic) NSString *cityTitle;
@property (nonatomic) NSString *regionTitle;
@property (nonatomic) NSNumber *stationId;
@property (nonatomic) NSString *stationTitle;

@end
