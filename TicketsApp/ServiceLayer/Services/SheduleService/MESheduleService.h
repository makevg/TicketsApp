//
//  MESheduleService.h
//  TicketsApp
//
//  Created by Maximychev Evgeny on 16.03.16.
//  Copyright © 2016 Maximychev Evgeny. All rights reserved.
//

#import "MEBaseService.h"

#define Shedule_service [MESheduleService sharedInstance]

@interface MESheduleService : MEBaseService

+ (instancetype)sharedInstance;
- (NSArray *)citiesFrom;
- (NSArray *)citiesTo;

@end
