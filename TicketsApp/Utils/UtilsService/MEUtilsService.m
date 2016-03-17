//
//  MEUtilsService.m
//  TicketsApp
//
//  Created by Максимычев Е.О. on 17.03.16.
//  Copyright © 2016 Maximychev Evgeny. All rights reserved.
//

#import "MEUtilsService.h"

@implementation MEUtilsService

#pragma mark - Singleton

+ (instancetype)sharedInstance {
    static dispatch_once_t once;
    static id sharedInstance;
    dispatch_once(&once, ^{
        sharedInstance = [[self alloc] init];
        [sharedInstance lazyLoad];
    });
    return sharedInstance;
}

#pragma mark - Lazy init

- (NSString *)appVersion {
    if (!_appVersion) {
        _appVersion = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"];
    }
    return _appVersion;
}

- (NSString *)copyright {
    if (!_copyright) {
        _copyright = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"NSHumanReadableCopyright"];
    }
    return _copyright;
}

#pragma mark - Private

- (void)lazyLoad {
    
}

@end
