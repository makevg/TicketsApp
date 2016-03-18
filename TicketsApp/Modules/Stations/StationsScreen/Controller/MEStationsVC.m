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

@interface MEStationsVC () <UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate, UISearchResultsUpdating>
@property (strong, nonatomic) IBOutlet MEStationsView *contentView;
@property (nonatomic) UISearchController *searchController;
@end

@implementation MEStationsVC {
    NSArray<MECity *> *data;
    NSArray<MEStation *> *allStations;
    NSMutableArray<MEStation *> *searchResults;
    MEStationVC *destinationVC;
    MEStation *selectedStation;
}

#pragma mark - Lifecycle

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self prepareNavItem];
}

- (void)dealloc {
    [self.searchController.view removeFromSuperview];
}

#pragma mark - Public

+ (NSString *)storyboardName {
    return cStationsVCStoryboardName;
}

#pragma mark - Configure

- (void)configureController {
    [self prepareData];
    [self prepareSearchController];
    [self setDataSourceAndDelegate];
}

#pragma mark - Private

- (void)setDataSourceAndDelegate {
    self.contentView.tableView.dataSource = self;
    self.contentView.tableView.delegate = self;
}

- (void)prepareSearchController {
    self.searchController = [[UISearchController alloc] initWithSearchResultsController:nil];
    self.searchController.searchResultsUpdater = self;
    self.searchController.dimsBackgroundDuringPresentation = NO;
    
    self.searchController.searchBar.delegate = self;
    self.contentView.tableView.tableHeaderView = self.searchController.searchBar;
    
    self.definesPresentationContext = YES;
    [self.searchController.searchBar sizeToFit];
}

- (void)prepareNavItem {
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@""
                                                                             style:UIBarButtonItemStylePlain
                                                                            target:nil
                                                                            action:nil];
}

- (void)prepareData {
    data = [Schedule_service citiesDataByStationsType:self.stationsType];
    allStations = [Schedule_service allStationsByStationsType:self.stationsType];
    searchResults = [NSMutableArray array];
}

- (MEStation *)stationAtIndexPath:(NSIndexPath *)indexPath {
    if (self.searchController.isActive) {
        return searchResults[indexPath.section];
    } else {
        MECity *city = data[indexPath.section];
        return city.stations[indexPath.row];
    }
}

- (void)searchForText:(NSString *)searchText {
    [searchResults removeAllObjects];
    for (MEStation *station in allStations) {
        NSRange range = [station.stationTitle
                         rangeOfString:searchText
                         options:NSCaseInsensitiveSearch];
        if (range.location != NSNotFound) {
            [searchResults addObject:station];
        }
    }
}

#pragma mark - Actions

- (IBAction)tappedCancelButton:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.searchController.active ? 1 : [data count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (self.searchController.active) {
        return [searchResults count];
    } else {
        MECity *city = data[section];
        return [city.stations count];
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *identifier = [MEStationCell cellIdentifier];
    MEStationCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier
                                                          forIndexPath:indexPath];
    MEStation *station = [self stationAtIndexPath:indexPath];
    [cell setModel:station];
    return cell;
}

- (nullable NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return self.searchController.active ? nil : data[section].cityTitle;
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
    
    if (self.searchController.isActive) {
        [self.navigationController dismissViewControllerAnimated:NO completion:nil];
    } else {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath {
    selectedStation = [self stationAtIndexPath:indexPath];
    [self performSegueWithIdentifier:cStationSegueIdentifier sender:self];
}

#pragma mark - UISearchResultsUpdating

- (void)updateSearchResultsForSearchController:(UISearchController *)searchController {
    NSString *searchString = searchController.searchBar.text;
    [self searchForText:searchString];
    [self.contentView.tableView reloadData];
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:cStationSegueIdentifier]) {
        destinationVC = segue.destinationViewController;
        destinationVC.station = selectedStation;
    }
}

@end
