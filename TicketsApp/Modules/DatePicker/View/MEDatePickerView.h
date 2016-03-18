//
//  MEDatePickerView.h
//  TicketsApp
//
//  Created by Максимычев Е.О. on 18.03.16.
//  Copyright © 2016 Maximychev Evgeny. All rights reserved.
//

#import "MEBaseView.h"

@interface MEDatePickerView : MEBaseView

- (void)setMinDate:(NSDate *)date;
- (NSDate *)getDate;

@end
