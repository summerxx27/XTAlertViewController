//
//  XTDefaultCell.m
//  XTAlterViewController
//
//  Created by zjwang on 16/8/31.
//  Copyright © 2016年 夏天然后. All rights reserved.
//

#import "XTDefaultCell.h"

@implementation XTDefaultCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end


@implementation XTAlterDoubleCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.button = [UIButton buttonWithType:UIButtonTypeCustom];
        self.button.frame = CGRectMake(0, 0, SCREEN_WIDTH * 0.75, ALERT_STACKVIEW_HEIGHT);
        self.button.titleLabel.font = [UIFont fontWithName:@"Avenir-Heavy" size:17];
        [self.button setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        [self.button setTitleColor:[UIColor blackColor] forState:UIControlStateSelected];
        [self.button addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:self.button];
        
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(10, 0, SCREEN_WIDTH * 0.75 - 20, 2)];
        view.backgroundColor = [[UIColor lightGrayColor] colorWithAlphaComponent:0.25];
        [self.button addSubview:view];
        
    }
    return self;
}
- (void)click:(UIButton *)btn
{
    
}
@end