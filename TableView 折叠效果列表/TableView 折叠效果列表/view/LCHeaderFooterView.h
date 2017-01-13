//
//  LCHeaderFooterView.h
//  TableView 折叠效果列表
//
//  Created by LiCheng on 2016/12/26.
//  Copyright © 2016年 LiCheng. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LCHeaderFooterView;
@class GroupModel;

@protocol LCHeaderViewDelegate <NSObject>

/** 代理 - 分类点击事件 */
-(void)lc_headerViewClicked:(LCHeaderFooterView *)headerView;

@end

@interface LCHeaderFooterView : UITableViewHeaderFooterView

/** 数据模型 */
@property (nonatomic, strong) GroupModel *groupModel;
/** 代理 */
@property (nonatomic, assign) id<LCHeaderViewDelegate>lc_delegate;

/** 创建 headerView */
+ (instancetype)lc_creatHeaderView:(UITableView *)tableView;
@end
