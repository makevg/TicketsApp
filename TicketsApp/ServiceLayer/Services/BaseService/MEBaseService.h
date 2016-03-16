//
//  MEBaseService.h
//  TicketsApp
//
//  Created by Maximychev Evgeny on 16.03.16.
//  Copyright © 2016 Maximychev Evgeny. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MEBaseService : NSObject

+ (NSDictionary *)jsonDataFromFile:(NSString *)filePath;

@end
