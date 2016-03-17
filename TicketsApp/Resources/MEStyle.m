//
//  MEStyle.m
//  TicketsApp
//
//  Created by Максимычев Е.О. on 17.03.16.
//  Copyright © 2016 Maximychev Evgeny. All rights reserved.
//

#import "MEStyle.h"

#define RGB(r, g, b) [UIColor colorWithRed:r/255.f green:g/255.f blue:b/255.f alpha:1.f]

NSString *const RegularFontName = @"HelveticaNeue";
NSString *const BoldFontName = @"HelveticaNeue-Bold";

@implementation MEStyle

// Colors

+ (UIColor *)blueColor {
    return RGB(48, 61, 81);
}

+ (UIColor *)whiteColor {
    return [UIColor whiteColor];
}

+ (UIColor *)grayColor {
    return RGB(103, 105, 109);
}

// Fonts

+ (UIFont *)defaultFontOfSize:(CGFloat)size {
    return [UIFont fontWithName:RegularFontName size:size];
}

+ (UIFont *)boldFontOfSize:(CGFloat)size {
    return [UIFont fontWithName:BoldFontName size:size];
}

@end
