//
//  ViewController.m
//  TicketsApp
//
//  Created by Maximychev Evgeny on 16.03.16.
//  Copyright © 2016 Maximychev Evgeny. All rights reserved.
//

#import "ViewController.h"
#import "MESheduleService.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray *citiesFrom = [Shedule_service citiesFrom];
    NSLog(@"%@", citiesFrom.description);
    NSArray *citiesTo = [Shedule_service citiesTo];
    NSLog(@"%@", citiesTo.description);

}

@end
