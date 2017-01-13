//
//  TableViewCell.h
//  TableView 折叠效果列表
//
//  Created by LiCheng on 2016/12/26.
//  Copyright © 2016年 LiCheng. All rights reserved.
//

#import <UIKit/UIKit.h>
@class FriendModel;
@interface TableViewCell : UITableViewCell
@property (nonatomic, strong) FriendModel *friendModel;

+(instancetype)loadCell;

@end
