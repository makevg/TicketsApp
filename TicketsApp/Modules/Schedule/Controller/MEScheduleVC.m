//
//  MEScheduleVC.m
//  TicketsApp
//
//  Created by Максимычев Е.О. on 17.03.16.
//  Copyright © 2016 Maximychev Evgeny. All rights reserved.
//

#import "MEScheduleVC.h"
#import "MEStationsVC.h"

@interface MEScheduleVC ()

@end

@implementation MEScheduleVC

#pragma mark - Configure

- (void)configureController {
    
}

#pragma mark - Private

- (void)showStationsByType:(MEStationsType)type {
    MEStationsVC *vc = (MEStationsVC *) [self loadControllerFromStoryboard:[MEStationsVC storyboardName]];
    vc.stationsType = type;
    UINavigationController *navVC = [[UINavigationController alloc] initWithRootViewController:vc];
    [self.navigationController presentViewController:navVC animated:YES completion:nil];
}

#pragma mark - Actions

- (IBAction)tappedFromButton:(id)sender {
    [self showStationsByType:MEStationsTypeFrom];
}

- (IBAction)tappedToButton:(id)sender {
    [self showStationsByType:MEStationsTypeTo];
}

@end
