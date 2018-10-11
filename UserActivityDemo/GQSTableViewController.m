//
//  GQSTableViewController.m
//  UserActivityDemo
//
//  Created by 郭桥生 on 2018/10/10.
//  Copyright © 2018 guoqiaosheng. All rights reserved.
//

#import "GQSTableViewController.h"
#import "GQSDetailViewController.h"
#import <CoreSpotlight/CoreSpotlight.h>
#import <MobileCoreServices/MobileCoreServices.h>

@interface GQSTableViewController ()

@end

@implementation GQSTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:UITableViewCell.class forCellReuseIdentifier:@"cell"];
    [[CSSearchableIndex defaultSearchableIndex] deleteAllSearchableItemsWithCompletionHandler:nil];
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.textLabel.text = @[@"Joya", @"Tim", @"Salis", @"Clame"][indexPath.row];
    cell.detailTextLabel.text = @[@"A Coder", @"A Teacher", @"An Doctor", @"A Killer"][indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    GQSDetailViewController *vc = [[GQSDetailViewController alloc] init];
    vc.detailTitle = @[@"Joya", @"Tim", @"Salis", @"Clame"][indexPath.row];
    vc.detailDesc = @[@"A Coder", @"A Teacher", @"An Doctor", @"A Killer"][indexPath.row];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)restoreUserActivityState:(NSUserActivity *)activity {
    GQSDetailViewController *vc = [[GQSDetailViewController alloc] init];
    vc.detailID = [activity.userInfo objectForKey:CSSearchableItemActivityIdentifier];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
