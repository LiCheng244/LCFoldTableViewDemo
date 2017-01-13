//
//  GroupModel.h
//  TableView 折叠效果列表
//
//  Created by LiCheng on 2017/1/12.
//  Copyright © 2017年 LiCheng. All rights reserved.
//

#import <Foundation/Foundation.h>
@class FriendsModel;


@interface GroupModel : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *online;
@property (nonatomic, strong) NSArray *friends;
@property (nonatomic, assign) BOOL isOpen; // 默认都是 false

- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)groupWithDict:(NSDictionary *)dict;

@end
