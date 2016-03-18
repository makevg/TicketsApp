//
//  MEBaseButton.m
//  TicketsApp
//
//  Created by Максимычев Е.О. on 18.03.16.
//  Copyright © 2016 Maximychev Evgeny. All rights reserved.
//

#import "MEBaseButton.h"

@implementation MEBaseButton

#pragma mark - Init

- (id)initWithCoder:(NSCoder *)aDecoder {
    if ((self = [super initWithCoder:aDecoder])) {
        [self localInit];
    }
    return self;
}

#pragma mark - Private

- (void)localInit {
    [self setTitleColor:[MEStyle whiteColor] forState:UIControlStateNormal];
    self.titleLabel.font = [MEStyle defaultFontOfSize:14.f];
    [self configure];
}

#pragma mark - Public

- (void)configure {
    // Abstract method.
}

@end
