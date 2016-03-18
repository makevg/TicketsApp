//
//  MERoundedButton.m
//  TicketsApp
//
//  Created by Максимычев Е.О. on 18.03.16.
//  Copyright © 2016 Maximychev Evgeny. All rights reserved.
//

#import "MERoundedButton.h"

@implementation MERoundedButton

#pragma mark - Configure

- (void)configure {
    self.layer.borderWidth = 1.5f;
    self.layer.borderColor = [MEStyle blueColor].CGColor;
    self.layer.cornerRadius = 4.f;
    self.clipsToBounds = YES;
    [self setTitleColor:[MEStyle blueColor] forState:UIControlStateNormal];
}

@end
