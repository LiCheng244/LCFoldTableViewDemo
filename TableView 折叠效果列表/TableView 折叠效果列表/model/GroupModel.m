//
//  GroupModel.m
//  TableView 折叠效果列表
//
//  Created by LiCheng on 2017/1/12.
//  Copyright © 2017年 LiCheng. All rights reserved.
//

#import "GroupModel.h"
#import "FriendModel.h"
@implementation GroupModel
- (instancetype)initWithDict:(NSDictionary *)dict {
    self = [super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dict];
        NSMutableArray *mArr = [NSMutableArray array];
        for (NSDictionary *dict in self.friends) {
            FriendModel *friendModel = [FriendModel friendWithDict:dict];
            [mArr addObject:friendModel];
        }
        self.friends = mArr;
    }
    return self;
}
+ (instancetype)groupWithDict:(NSDictionary *)dict {
    return [[self alloc] initWithDict:dict];;
}
- (void)setValue:(id)value forUndefinedKey:(NSString *)key {

}
@end
