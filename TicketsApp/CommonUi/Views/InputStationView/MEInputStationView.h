//
//  MEInputStationView.h
//  TicketsApp
//
//  Created by Максимычев Е.О. on 18.03.16.
//  Copyright © 2016 Maximychev Evgeny. All rights reserved.
//

#import "MEBaseView.h"

typedef NS_ENUM(NSUInteger, MEInputStationViewType) {
    MEInputStationViewTypeFrom = 0,
    MEInputStationViewTypeTo
};

@protocol MEInputStationViewDelegate;

@interface MEInputStationView : MEBaseView

@property (nonatomic) MEInputStationViewType type;
@property (weak, nonatomic) id<MEInputStationViewDelegate> delegate;

- (void)setStationTitle:(NSString *)title;
- (void)configureByType:(MEInputStationViewType)type;

@end

@protocol MEInputStationViewDelegate <NSObject>

- (void)tappedView:(MEInputStationView *)view;

@end
