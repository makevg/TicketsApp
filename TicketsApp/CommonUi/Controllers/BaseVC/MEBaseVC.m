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
    [self prepareTapRecognizer];
    [self configureController];
}

- (void)prepareTapRecognizer {
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                                           action:@selector(performTapppedBackgroundAction)];
    [self.view addGestureRecognizer:tapGestureRecognizer];
}

- (void)performTapppedBackgroundAction {
    [self.view endEditing:YES];
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

- (void)configureController {
    // Abstract method.
}

@end
