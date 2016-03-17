//
//  ViewController.m
//  TicketsApp
//
//  Created by Maximychev Evgeny on 16.03.16.
//  Copyright © 2016 Maximychev Evgeny. All rights reserved.
//

#import "ViewController.h"
#import "MEScheduleService.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray *citiesFrom = [Schedule_service citiesFrom];
    NSLog(@"%@", citiesFrom.description);
    NSArray *citiesTo = [Schedule_service citiesTo];
    NSLog(@"%@", citiesTo.description);

}

@end
