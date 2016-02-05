//
//  BUProfileOccupationVC.m
//  TheBureau
//
//  Created by Manjunath on 25/01/16.
//  Copyright © 2016 Bureau. All rights reserved.
//

#import "BUProfileOccupationVC.h"
#import "EmployementStatusTVCell.h"
#import "HighLevelEducationTVCell.h"

@interface BUProfileOccupationVC ()<UITableViewDataSource,UITableViewDelegate, HighLevelEducationTVCellDelegate,EmployementStatusTVCellDelegate>


@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic) NSInteger tableViewDataSource;
@property (nonatomic) CGFloat employementTVCellHeight;
@property (nonatomic) CGFloat highLevelEducationTVCellHeight;


@end

@implementation BUProfileOccupationVC

#pragma mark - View Life Cycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self loadUI];
    [self loadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - UI

- (void)loadUI
{
    self.tableView.dataSource   = self;
    self.tableView.delegate     = self;
}

- (void)loadData
{
    self.tableViewDataSource            = 2;
    self.employementTVCellHeight        = 170.0;
    self.highLevelEducationTVCellHeight = 65.0;
}

#pragma mark - Table View Datasource

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.tableViewDataSource;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    id cellToReturn = nil;
    if (indexPath.row == 0)
    {
        static NSString *employementCellIdentifier = @"EmployementStatusTVCell";
        EmployementStatusTVCell *cell = [tableView dequeueReusableCellWithIdentifier:employementCellIdentifier];
        cell.delegate = self;
        cellToReturn = cell;
    }
    else
    {
        static NSString *educationCellIdentifier = @"HighLevelEducationTVCell";
        HighLevelEducationTVCell *cell = [tableView dequeueReusableCellWithIdentifier:educationCellIdentifier];
        cell.delegate = self;
        cellToReturn = cell;
    }
    
    return cellToReturn;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat height;
    
    if (indexPath.row == 0)
    {
        height = self.employementTVCellHeight;
    }
    else
    {
        height = self.highLevelEducationTVCellHeight;
    }
    return height;
}

#pragma mark - HighLevelEducationTVCellDelegate

- (void)addNextLevelButtonTapped
{
    self.tableViewDataSource++;
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:self.tableViewDataSource - 1 inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    [self.tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionTop animated:YES];
}

- (void)updateHighLevelEducationTVCell
{
    self.highLevelEducationTVCellHeight = 387.0;
    [self.tableView reloadData];
}

#pragma mark - EmployementStatusTVCellDelegate

- (void)updateEmployementCellHeightForOthers
{
    self.employementTVCellHeight = 170.0;
    [self.tableView reloadData];
}

- (void)updateEmployementCellHeightForEmployed
{
    self.employementTVCellHeight = 270.0;
    [self.tableView reloadData];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


-(IBAction)continueClicked:(id)sender
{
    UIStoryboard *sb =[UIStoryboard storyboardWithName:@"ProfileCreation" bundle:nil];
    BUProfileOccupationVC *vc = [sb instantiateViewControllerWithIdentifier:@"BUProfileOccupationVC"];
    [self.navigationController pushViewController:vc animated:YES];
    
}
@end
