//
//  MEBaseTableViewCell.h
//  TicketsApp
//
//  Created by Максимычев Е.О. on 17.03.16.
//  Copyright © 2016 Maximychev Evgeny. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MEStyle.h"

@interface MEBaseTableViewCell : UITableViewCell

+ (NSString *)cellIdentifier;
+ (CGFloat)cellHeight;

- (void)setModel:(id)model;
- (void)configureCell;

@end
