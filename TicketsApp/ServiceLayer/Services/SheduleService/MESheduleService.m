//
//  MESheduleService.m
//  TicketsApp
//
//  Created by Maximychev Evgeny on 16.03.16.
//  Copyright © 2016 Maximychev Evgeny. All rights reserved.
//

#import "MESheduleService.h"
#import "MECity.h"

@implementation MESheduleService {
    NSDictionary *sheduleData;
    NSArray<MECity *> *citiesFromArray;
    NSArray<MECity *> *citiesToArray;
}

#pragma mark - Singletone

+ (instancetype)sharedInstance {
    static dispatch_once_t once;
    static id sharedInstance;
    dispatch_once(&once, ^{
        sharedInstance = [[self alloc] init];
        [sharedInstance lazyLoad];
    });
    return sharedInstance;
}

#pragma mark - Private

- (void)lazyLoad {
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"allStations"
                                                         ofType:@"json"];
    sheduleData = [MEBaseService jsonDataFromFile:filePath];
    citiesFromArray = [self loadCitiesFromArray:sheduleData[@"citiesFrom"]];
    citiesToArray = [self loadCitiesFromArray:sheduleData[@"citiesTo"]];
}

- (NSArray<MECity *> *)loadCitiesFromArray:(NSArray *)array {
    if (!array) return nil;
    
    NSMutableArray<MECity *> *cities = [NSMutableArray<MECity *> new];
    
    for (NSDictionary *cityDict in array) {
        MECity *city = [MECity new];
        city.countryTitle = cityDict[@"countryTitle"];
        
        NSDictionary *cityLocationDict = cityDict[@"point"];
        city.point = [self cityLocationFromDictionary:cityLocationDict];
        
        city.districtTitle = cityDict[@"districtTitle"];
        city.cityId = cityDict[@"cityId"];
        city.cityTitle = cityDict[@"cityTitle"];
        city.regionTitle = cityDict[@"regionTitle"];
        city.stations = [self loadStationsFromArray:cityDict[@"stations"]];
        
        [cities addObject:city];
    }
    return cities;
}

- (NSArray<MEStation *> *)loadStationsFromArray:(NSArray *)array {
    if (!array) return nil;
    
    NSMutableArray<MEStation *> *stations = [NSMutableArray<MEStation *> new];
    
    for (NSDictionary *stationDict in array) {
        MEStation *station = [MEStation new];
        station.countryTitle = stationDict[@"countryTitle"];
        
        NSDictionary *stationLocationDict = stationDict[@"point"];
        station.point = [self stationLocationFromDictionary:stationLocationDict];
        
        station.districtTitle = stationDict[@"districtTitle"];
        station.cityId = stationDict[@"cityId"];
        station.cityTitle = stationDict[@"cityTitle"];
        station.regionTitle = stationDict[@"regionTitle"];
        station.stationId = stationDict[@"stationId"];
        station.stationTitle = stationDict[@"stationTitle"];
        
        [stations addObject:station];
    }
    return stations;
}

- (MECityLocation *)cityLocationFromDictionary:(NSDictionary *)dictionary {
    if (!dictionary) return nil;
    
    NSNumber *longitude = dictionary[@"longitude"];
    NSNumber *latitude = dictionary[@"latitude"];
    return [[MECityLocation alloc] initWithLongitude:longitude.doubleValue
                                            latitude:latitude.doubleValue];
}

- (MEStationLocation *)stationLocationFromDictionary:(NSDictionary *)dictionary {
    if (!dictionary) return nil;
    
    NSNumber *longitude = dictionary[@"longitude"];
    NSNumber *latitude = dictionary[@"latitude"];
    return [[MEStationLocation alloc] initWithLongitude:longitude.doubleValue
                                               latitude:latitude.doubleValue];
}

#pragma mark - Public

- (NSArray *)citiesFrom {
    return citiesFromArray;
}

- (NSArray *)citiesTo {
    return citiesToArray;
}

@end
