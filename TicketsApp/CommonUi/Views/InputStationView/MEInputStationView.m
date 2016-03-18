//
//  MEInputStationView.m
//  TicketsApp
//
//  Created by Максимычев Е.О. on 18.03.16.
//  Copyright © 2016 Maximychev Evgeny. All rights reserved.
//

#import "MEInputStationView.h"

NSString *const cInputStationsFromTitle = @"Station from";
NSString *const cInputStationsToTitle = @"Station to";

@interface MEInputStationView ()
@property (strong, nonatomic) IBOutlet UIView *mainView;
@property (weak, nonatomic) IBOutlet UILabel *stationLabel;
@end

@implementation MEInputStationView

- (void)setType:(MEInputStationViewType)type {
    _type = type;
    [self configureByType:type];
}

#pragma mark - Init

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:self options:nil];
        [self addSubview:self.mainView];
        [self configureView];
    }
    return self;
}

#pragma mark - Private

- (void)configureView {
    [self prepareConstraints];
    [self configureSubviews];
}

- (void)prepareConstraints {
    [self.mainView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[view]|" options:0 metrics:nil views:@{@"view":self.mainView}]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[view]|" options:0 metrics:nil views:@{@"view":self.mainView}]];
}

- (void)configureSubviews {
    self.mainView.userInteractionEnabled = YES;
    [self setBackgroundColor:[UIColor clearColor]];
    [self.mainView setBackgroundColor:[MEStyle lightGrayColor]];
    self.mainView.layer.cornerRadius = 4.5f;
    self.mainView.clipsToBounds = YES;
    self.stationLabel.font = [MEStyle defaultFontOfSize:12.f];
}

#pragma mark - Public

- (void)setStationTitle:(NSString *)title {
    self.stationLabel.text = title;
}

- (void)configureByType:(MEInputStationViewType)type {
    switch (type) {
        case MEInputStationViewTypeFrom:
            [self setStationTitle:cInputStationsFromTitle];
            break;
        case MEInputStationViewTypeTo:
            [self setStationTitle:cInputStationsToTitle];
            break;
    }
}

#pragma mark - Actions

- (IBAction)tappedBackground:(id)sender {
    if (self.delegate) {
        [self.delegate tappedView:self];
    }
}

@end
