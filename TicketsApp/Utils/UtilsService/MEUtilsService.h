//
//  MEUtilsService.h
//  TicketsApp
//
//  Created by Максимычев Е.О. on 17.03.16.
//  Copyright © 2016 Maximychev Evgeny. All rights reserved.
//

#import <Foundation/Foundation.h>

#define Utils_service [MEUtilsService sharedInstance]

@interface MEUtilsService : NSObject

@property (nonatomic) NSString *appVersion;
@property (nonatomic) NSString *copyright;

+ (instancetype)sharedInstance;
+ (NSString *)stringByDate:(NSDate *)date;

@end
