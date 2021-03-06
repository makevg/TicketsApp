//
//  MEStationsView.m
//  TicketsApp
//
//  Created by Максимычев Е.О. on 17.03.16.
//  Copyright © 2016 Maximychev Evgeny. All rights reserved.
//

#import "MEStationsView.h"

@implementation MEStationsView

#pragma mark - Setup

- (void)setup {
    [self configureTableView];
}

#pragma mark - Private

- (void)configureTableView {
    self.tableView.tableFooterView = [UIView new];
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 44.f;
}

@end
