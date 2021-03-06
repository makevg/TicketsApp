//
//  MEAboutVC.m
//  TicketsApp
//
//  Created by Максимычев Е.О. on 17.03.16.
//  Copyright © 2016 Maximychev Evgeny. All rights reserved.
//

#import "MEAboutVC.h"
#import "MEAboutView.h"
#import "MEUtilsService.h"

@interface MEAboutVC ()
@property (strong, nonatomic) IBOutlet MEAboutView *contentView;
@end

@implementation MEAboutVC

#pragma mark - Configure

- (void)configureController {
    [self.contentView setAppVersion:[Utils_service appVersion]];
    [self.contentView setCopyright:[Utils_service copyright]];
}

@end
