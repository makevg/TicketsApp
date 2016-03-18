//
//  MEStationsVC.m
//  TicketsApp
//
//  Created by Максимычев Е.О. on 17.03.16.
//  Copyright © 2016 Maximychev Evgeny. All rights reserved.
//

#import "MEStationsVC.h"
#import "MEStationsView.h"
#import "MEStationCell.h"
#import "MECity.h"
#import "MEStationVC.h"

NSString *const cStationsVCStoryboardName = @"Stations";
NSString *const cStationSegueIdentifier = @"toShowStation";

@interface MEStationsVC () <UITableViewDataSource, UITableViewDelegate>
@property (strong, nonatomic) IBOutlet MEStationsView *contentView;
@end

@implementation MEStationsVC {
    NSArray<MECity *> *data;
    MEStationVC *destinationVC;
    MEStation *selectedStation;
}

#pragma mark - Lifecycle

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self prepareNavItem];
}

#pragma mark - Public

+ (NSString *)storyboardName {
    return cStationsVCStoryboardName;
}

#pragma mark - Configure

- (void)configureController {
    data = [Schedule_service citiesDataByStationsType:self.stationsType];
    [self setDataSourceAndDelegate];
}

#pragma mark - Private

- (void)setDataSourceAndDelegate {
    self.contentView.tableView.dataSource = self;
    self.contentView.tableView.delegate = self;
}

- (void)prepareNavItem {
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@""
                                                                             style:UIBarButtonItemStylePlain
                                                                            target:nil
                                                                            action:nil];
}

- (MEStation *)stationAtIndexPath:(NSIndexPath *)indexPath {
    MECity *city = data[indexPath.section];
    return city.stations[indexPath.row];
}

#pragma mark - Actions

- (IBAction)tappedCancelButton:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [data count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    MECity *city = data[section];
    return [city.stations count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *identifier = [MEStationCell cellIdentifier];
    MEStationCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier
                                                          forIndexPath:indexPath];
    [cell setModel:[self stationAtIndexPath:indexPath]];
    return cell;
}

- (nullable NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return data[section].cityTitle;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
    
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (self.delegate) {
        [self.delegate controller:self
                     selectSation:[self stationAtIndexPath:indexPath]];
    }
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath {
    selectedStation = [self stationAtIndexPath:indexPath];
    [self performSegueWithIdentifier:cStationSegueIdentifier sender:self];
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:cStationSegueIdentifier]) {
        destinationVC = segue.destinationViewController;
        destinationVC.station = selectedStation;
    }
}

@end
