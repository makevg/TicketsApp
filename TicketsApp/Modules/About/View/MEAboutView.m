//
//  MEAboutView.m
//  TicketsApp
//
//  Created by Максимычев Е.О. on 17.03.16.
//  Copyright © 2016 Maximychev Evgeny. All rights reserved.
//

#import "MEAboutView.h"

@interface MEAboutView ()
@property (weak, nonatomic) IBOutlet UILabel *copyrightLabel;
@property (weak, nonatomic) IBOutlet UILabel *appVersionLabel;
@end

@implementation MEAboutView

#pragma mark - Setup

- (void)setup {
    self.copyrightLabel.font = [MEStyle defaultFontOfSize:12.f];
    self.copyrightLabel.textColor = [MEStyle grayColor];
}

#pragma mark - Public

- (void)setAppVersion:(NSString *)appVersion {
    self.appVersionLabel.text = [NSString stringWithFormat:@"Версия %@", appVersion];
}

- (void)setCopyright:(NSString *)copyright {
    self.copyrightLabel.text = [NSString stringWithFormat:@"Copyright by %@", copyright];
}

@end
