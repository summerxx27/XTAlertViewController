//
//  XTDefaultCell.m
//  XTAlterViewController
//
//  Created by zjwang on 16/8/31.
//  Copyright © 2016年 夏天然后. All rights reserved.
//

#import "XTAlertStyleView.h"

@implementation XTAlertStyleView

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.btnLeft];
        [self.contentView addSubview:self.btnRight];
        
        // `Horizontal line`
        UIView *lineLeft = [[UIView alloc] initWithFrame:CGRectMake(15, 0, SCREEN_WIDTH * 0.75 / 2 - 30, 1.2)];
        lineLeft.backgroundColor = [[UIColor lightGrayColor] colorWithAlphaComponent:0.3];
        [self.btnLeft addSubview:lineLeft];
        UIView *lineRight = [[UIView alloc] initWithFrame:CGRectMake(15, 0, SCREEN_WIDTH * 0.75 / 2 - 30, 1.2)];
        lineRight.backgroundColor = [[UIColor lightGrayColor] colorWithAlphaComponent:0.3];
        [self.btnRight addSubview:lineRight];
        // `A vertical bar`
        UIView *centerLine = [[UIView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH * 0.75 / 2, 5, 1.2, ALERT_TABLEVIEW_HEIGHT - 15)];
        centerLine.backgroundColor = [[UIColor lightGrayColor] colorWithAlphaComponent:0.3];
        [self.contentView addSubview:centerLine];
        
    }
    return self;
}

- (UIButton *)btnLeft
{
    if (_btnLeft == nil) {
        self.btnLeft = [UIButton buttonWithType:UIButtonTypeCustom];
        self.btnLeft.frame = CGRectMake(0, 0, SCREEN_WIDTH * 0.75 / 2, ALERT_TABLEVIEW_HEIGHT);
        self.btnLeft.titleLabel.font = [UIFont fontWithName:@"Avenir-Heavy" size:17];
        self.btnLeft.tag = 0;
        [self.btnLeft setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        [self.btnLeft addTarget:self action:@selector(clickLeft:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _btnLeft;
}
- (UIButton *)btnRight
{
    if (_btnRight == nil) {
        self.btnRight = [UIButton buttonWithType:UIButtonTypeCustom];
        self.btnRight.frame = CGRectMake(SCREEN_WIDTH * 0.75 / 2, 0, SCREEN_WIDTH * 0.75 / 2, ALERT_TABLEVIEW_HEIGHT);
        self.btnRight.titleLabel.font = [UIFont fontWithName:@"Avenir-Heavy" size:17];
        self.btnRight.tag = 1;
        [self.btnRight setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        [self.btnRight addTarget:self action:@selector(clickRight:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _btnRight;
}

- (void)clickLeft:(UIButton *)btn
{
    self.btnClickBlock(btn, btn.tag);
}
- (void)clickRight:(UIButton *)btn
{
    self.btnClickBlock(btn, btn.tag);
}

@end


@implementation XTAlterDoubleCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.titleLabel];
        [self lineSet];
    }
    return self;
}
- (UILabel *)titleLabel
{
    if (_titleLabel == nil) {
        // `title`
        self.titleLabel = [[UILabel alloc] init];
        self.titleLabel.frame = CGRectMake(0, 1, SCREEN_WIDTH * 0.75, ALERT_TABLEVIEW_HEIGHT - 2);
        self.titleLabel.font = [UIFont fontWithName:@"Avenir-Heavy" size:17];
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.textColor = [UIColor lightGrayColor];
    }
    return _titleLabel;
}
- (void)lineSet
{
    // `Horizontal line`
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(15, 0, SCREEN_WIDTH * 0.75 - 30, 1.2)];
    view.backgroundColor = [[UIColor lightGrayColor] colorWithAlphaComponent:0.3];
    [self.titleLabel addSubview:view];
}
@end