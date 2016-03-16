//
//  MEBaseService.m
//  TicketsApp
//
//  Created by Maximychev Evgeny on 16.03.16.
//  Copyright © 2016 Maximychev Evgeny. All rights reserved.
//

#import "MEBaseService.h"

@implementation MEBaseService

+ (NSDictionary *)jsonDataFromFile:(NSString *)filePath {
    NSError *deserializingError;
    NSURL *localFileURL = [NSURL fileURLWithPath:filePath];
    NSData *contentOfLocalFile = [NSData dataWithContentsOfURL:localFileURL];
    id object = [NSJSONSerialization JSONObjectWithData:contentOfLocalFile
                                                options:kNilOptions
                                                  error:&deserializingError];
    return deserializingError ? nil : object;
}

@end
