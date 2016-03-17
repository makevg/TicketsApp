//
//  MEStyle.h
//  TicketsApp
//
//  Created by Максимычев Е.О. on 17.03.16.
//  Copyright © 2016 Maximychev Evgeny. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface MEStyle : NSObject

// Colors
+ (UIColor *)blueColor;
+ (UIColor *)whiteColor;
+ (UIColor *)grayColor;

// Fonts
+ (UIFont *)defaultFontOfSize:(CGFloat)size;
+ (UIFont *)boldFontOfSize:(CGFloat)size;

@end
