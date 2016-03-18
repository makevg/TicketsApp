//
//  MEBaseVC.h
//  TicketsApp
//
//  Created by Максимычев Е.О. on 17.03.16.
//  Copyright © 2016 Maximychev Evgeny. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MEBaseVC : UIViewController

+ (NSString *)storyboardName;
+ (NSString *)identifier;
+ (UIView *)loadViewByNibName:(NSString *)nibName;

- (void)configureController;
- (UIViewController *)loadControllerFromStoryboard:(NSString *)storyboardName;
- (UIViewController *)loadControllerFromStoryboard:(NSString *)storyboardName
                                      byIdentifier:(NSString *)identifier;
- (void)showAlertWithTitle:(NSString *)title message:(NSString *)message;

@end
