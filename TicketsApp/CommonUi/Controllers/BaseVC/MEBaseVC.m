//
//  MEBaseVC.m
//  TicketsApp
//
//  Created by Максимычев Е.О. on 17.03.16.
//  Copyright © 2016 Maximychev Evgeny. All rights reserved.
//

#import "MEBaseVC.h"

@interface MEBaseVC ()

@end

@implementation MEBaseVC

#pragma mark - Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    [self localConfigure];
}

#pragma mark - Private

- (void)localConfigure {
    [self configureController];
}

#pragma mark - Public

+ (NSString *)storyboardName {
    return @"";
}

+ (NSString *)identifier {
    return @"";
}

+ (UIView *)loadViewByNibName:(NSString *)nibName {
    NSArray *viewNib = [[NSBundle mainBundle] loadNibNamed:nibName
                                                     owner:self
                                                   options:nil];
    return (UIView *)[viewNib firstObject];
}

- (UIViewController *)loadControllerFromStoryboard:(NSString *)storyboardName {
    UIStoryboard *sb = [UIStoryboard storyboardWithName:storyboardName bundle:nil];
    UIViewController *vc = [sb instantiateInitialViewController];
    return vc;
}

- (UIViewController *)loadControllerFromStoryboard:(NSString *)storyboardName byIdentifier:(NSString *)identifier {
    UIStoryboard *sb = [UIStoryboard storyboardWithName:storyboardName bundle:nil];
    UIViewController *vc = [sb instantiateViewControllerWithIdentifier:identifier];
    return vc;
}

- (void)configureController {
    // Abstract method.
}

@end