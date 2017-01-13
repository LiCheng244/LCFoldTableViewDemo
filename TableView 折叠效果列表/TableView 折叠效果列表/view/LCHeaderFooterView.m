//
//  LCHeaderFooterView.m
//  TableView 折叠效果列表
//
//  Created by LiCheng on 2016/12/26.
//  Copyright © 2016年 LiCheng. All rights reserved.
//

#import "LCHeaderFooterView.h"
#import "GroupModel.h"


@interface LCHeaderFooterView ()
/** 头部视图点击 */
@property (nonatomic, strong) UIButton *headerViewBtn;
/** 当前在线人数 */
@property (nonatomic, strong) UILabel *onlineNumLabel;

/** 分割线 */
@property (nonatomic, strong) UIView *wireView;


@end


@implementation LCHeaderFooterView

+(instancetype)lc_creatHeaderView:(UITableView *)tableView{

    static NSString *cellID = @"header";
    LCHeaderFooterView *headerView =  [tableView dequeueReusableHeaderFooterViewWithIdentifier:cellID];
    if (headerView == nil) {
        headerView = [[self alloc] initWithReuseIdentifier:cellID];
    }
    return headerView;
}

-(instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier{

    self = [super initWithReuseIdentifier: reuseIdentifier];
    if (self) {

        // 按钮
        self.headerViewBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        self.headerViewBtn.backgroundColor = [UIColor colorWithRed:237/255.0 green:237/255.0 blue:237/255.0 alpha:1];
        [self.headerViewBtn setImage:[UIImage imageNamed:@"arrow"] forState:UIControlStateNormal];
        [self.headerViewBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        self.headerViewBtn.contentEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0); //设置内容边距
        self.headerViewBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft; //内容的水平对齐方式
        self.headerViewBtn.imageView.clipsToBounds = NO; // 不裁剪图片
        self.headerViewBtn.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
        self.headerViewBtn.imageView.contentMode = UIViewContentModeCenter;
        [self.headerViewBtn addTarget:self action:@selector(headerViewClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.headerViewBtn];

        // 当前在线人数
        UILabel *label = [[UILabel alloc] init];
        label.textAlignment = NSTextAlignmentRight;
        self.onlineNumLabel = label;
        [self addSubview:label];

        // 线
        UIView *view = [[UIView alloc] init];
        view.backgroundColor = [UIColor colorWithRed:194/255.0 green:194/255.0 blue:194/255.0 alpha:1];
        [self addSubview:view];
        self.wireView = view;
    }
    return self;
}

/** 点击事件 */
-(void)headerViewClick:(UIButton *)button{

    // 修改了 headerView 的状态
    self.groupModel.isOpen = !self.groupModel.isOpen;
    if ([self.lc_delegate respondsToSelector:@selector(lc_headerViewClicked:)]) {
        [self.lc_delegate lc_headerViewClicked:self];
    }
}

/** 布局 */
-(void)layoutSubviews{
    [super layoutSubviews];

    self.headerViewBtn.frame = self.bounds;
    self.onlineNumLabel.frame = CGRectMake(self.bounds.size.width - 70, 0, 60, self.frame.size.height);
    self.wireView.frame = CGRectMake(0, self.bounds.size.height - 1, self.bounds.size.width, 1);

    //添加观察者，观察isOpen属性的变化，来调节指示器的状态
    [self addObserver:self forKeyPath:@"groupModel.isOpen" options:NSKeyValueObservingOptionInitial context:nil];
}

/** 给控件赋值 */
-(void)setGroupModel:(GroupModel *)groupModel{
    _groupModel = groupModel;
    [self.headerViewBtn setTitle:groupModel.name forState:(UIControlStateNormal)];
    self.onlineNumLabel.text = [NSString stringWithFormat:@"%@/%ld", groupModel.online, groupModel.friends.count];
}

/** 接收到 isOpen 值变化时，触发的方法 */
-(void)addObserver:(NSObject *)observer forKeyPath:(NSString *)keyPath options:(NSKeyValueObservingOptions)options context:(void *)context{
    self.headerViewBtn.imageView.transform = self.groupModel.isOpen ? CGAffineTransformMakeRotation(M_PI_2) : CGAffineTransformMakeRotation(0);
}
@end
