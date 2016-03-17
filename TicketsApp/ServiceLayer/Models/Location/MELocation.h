//
//  MELocation.h
//  TicketsApp
//
//  Created by Максимычев Е.О. on 17.03.16.
//  Copyright © 2016 Maximychev Evgeny. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MELocation : NSObject

@property (nonatomic) double longitude;
@property (nonatomic) double latitude;

- (instancetype)initWithLongitude:(double)longitude latitude:(double)latitude;

@end
