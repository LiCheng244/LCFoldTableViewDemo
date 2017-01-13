//
//  TableViewCell.m
//  TableView 折叠效果列表
//
//  Created by LiCheng on 2016/12/26.
//  Copyright © 2016年 LiCheng. All rights reserved.
//

#import "TableViewCell.h"
#import "FriendModel.h"

@interface TableViewCell ()
@property (weak, nonatomic) IBOutlet UIImageView *iconImg;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *detailLabel;

@end
@implementation TableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

+(instancetype)loadCell{
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil] lastObject];

}

-(void)setFriendModel:(FriendModel *)friendModel{

    _friendModel = friendModel;
    self.iconImg.image = [UIImage imageNamed:friendModel.icon];
    self.nameLabel.text = friendModel.name;
    self.detailLabel.text = friendModel.intro;
}


@end
