//
//  MEScheduleService.h
//  TicketsApp
//
//  Created by Maximychev Evgeny on 16.03.16.
//  Copyright © 2016 Maximychev Evgeny. All rights reserved.
//

#import "MEBaseService.h"

#define Schedule_service [MEScheduleService sharedInstance]

typedef NS_ENUM(NSUInteger, MEStationsType) {
    MEStationsTypeFrom = 0,
    MEStationsTypeTo
};

@interface MEScheduleService : MEBaseService

+ (instancetype)sharedInstance;
- (NSArray *)citiesFrom;
- (NSArray *)citiesTo;
- (NSArray *)citiesDataByStationsType:(MEStationsType)type;
- (NSArray *)allStationsByStationsType:(MEStationsType)type;

@end
