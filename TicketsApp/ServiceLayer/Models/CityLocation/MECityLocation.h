//
//  MECityLocation.h
//  TicketsApp
//
//  Created by Maximychev Evgeny on 16.03.16.
//  Copyright © 2016 Maximychev Evgeny. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MECityLocation : NSObject

@property (nonatomic) double longitude;
@property (nonatomic) double latitude;

- (instancetype)initWithLongitude:(double)longitude latitude:(double)latitude;

@end
