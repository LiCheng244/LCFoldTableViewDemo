//
//  TableViewController.m
//  TableView 折叠效果列表
//
//  Created by LiCheng on 2016/12/26.
//  Copyright © 2016年 LiCheng. All rights reserved.
//

#import "TableViewController.h"
#import "TableViewCell.h"
#import "LCHeaderFooterView.h"
#import "GroupModel.h"
#import "FriendModel.h"

@interface TableViewController ()<LCHeaderViewDelegate>

/** 数据 */
@property (nonatomic, strong) NSArray *datas;
/** 数据模型 */
@property (nonatomic, strong) GroupModel *model;


@end

@implementation TableViewController

//数据
-(NSArray *)datas{
    if (!_datas) {

        // plist 文件解析
        NSString *path = [[NSBundle mainBundle] pathForResource:@"friends" ofType:@"plist"];
        NSArray *array = [NSArray arrayWithContentsOfFile:path];
        NSMutableArray *mArr = [NSMutableArray arrayWithCapacity:array.count];
        for (NSDictionary *dict in array) {
            GroupModel *model = [GroupModel groupWithDict:dict];
            [mArr addObject:model];
        }
        self.datas = mArr;
    }
    return _datas;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.tableView.tableFooterView = [[UITableView alloc] init];
}


#pragma mark - <UITableViewDataSource>
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.datas.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    GroupModel *groupModel = self.datas[section];
    return groupModel.isOpen ? groupModel.friends.count : 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    // 数据模型
    GroupModel *groupModel = self.datas[indexPath.section];
    FriendModel *friendModel = groupModel.friends[indexPath.row];

    TableViewCell *cell = [TableViewCell loadCell];
    cell.friendModel = friendModel;

    return cell;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{

    GroupModel *groupModel = self.datas[section];

    LCHeaderFooterView *headerView = [LCHeaderFooterView lc_creatHeaderView:tableView];
    headerView.lc_delegate = self;
    headerView.groupModel = groupModel;

    return headerView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 35;
}

#pragma mark - HeaderViewDelegate
-(void)lc_headerViewClicked:(LCHeaderFooterView *)headerView{

    //之前展开的列表收回
    if (self.model != headerView.groupModel) {
        self.model.isOpen = NO;
        self.model = headerView.groupModel;
    }
    [self.tableView reloadData];//刷新数据
}


@end
