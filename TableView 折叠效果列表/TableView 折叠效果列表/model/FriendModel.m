//
//  FriendModel.m
//  TableView 折叠效果列表
//
//  Created by LiCheng on 2017/1/12.
//  Copyright © 2017年 LiCheng. All rights reserved.
//

#import "FriendModel.h"

@implementation FriendModel
- (instancetype)initWithDict:(NSDictionary *)dict {
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}
+ (instancetype)friendWithDict:(NSDictionary *)dict {
    return [[self alloc] initWithDict:dict];
}
- (void)setValue:(id)value forUndefinedKey:(NSString *)key {

}
@end
