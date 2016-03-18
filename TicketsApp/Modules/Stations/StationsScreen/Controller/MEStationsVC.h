//
//  MEStationsVC.h
//  TicketsApp
//
//  Created by Максимычев Е.О. on 17.03.16.
//  Copyright © 2016 Maximychev Evgeny. All rights reserved.
//

#import "MEBaseVC.h"
#import "MEScheduleService.h"

@class MEStation;
@protocol MEStationsVCDelegate;

@interface MEStationsVC : MEBaseVC

@property (nonatomic) MEStationsType stationsType;
@property (weak, nonatomic) id<MEStationsVCDelegate> delegate;

@end

@protocol MEStationsVCDelegate <NSObject>

- (void)controller:(MEStationsVC *)controller selectSation:(MEStation *)station;

@end
