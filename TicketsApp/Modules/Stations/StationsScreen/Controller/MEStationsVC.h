//
//  MEStationsVC.h
//  TicketsApp
//
//  Created by Максимычев Е.О. on 17.03.16.
//  Copyright © 2016 Maximychev Evgeny. All rights reserved.
//

#import "MEBaseVC.h"

typedef NS_ENUM(NSUInteger, MEStationsType) {
    MEStationsTypeFrom = 0,
    MEStationsTypeTo
};

@interface MEStationsVC : MEBaseVC

@property (nonatomic) MEStationsType stationsType;

@end
