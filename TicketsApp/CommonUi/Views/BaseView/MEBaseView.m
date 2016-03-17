//
//  MEBaseView.m
//  TicketsApp
//
//  Created by Максимычев Е.О. on 17.03.16.
//  Copyright © 2016 Maximychev Evgeny. All rights reserved.
//

#import "MEBaseView.h"

@implementation MEBaseView

#pragma mark - Init

- (void)awakeFromNib {
    [super awakeFromNib];
    
    [self setup];
}

#pragma mark - Public

- (void)setup {
    // Abstract method.
}

- (void)setModel:(id)model {
    // Abstract method.
}

@end
