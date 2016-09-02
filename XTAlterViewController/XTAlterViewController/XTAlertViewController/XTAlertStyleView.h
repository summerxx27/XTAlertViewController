//
//  XTDefaultCell.h
//  XTAlterViewController
//
//  Created by zjwang on 16/8/31.
//  Copyright © 2016年 夏天然后. All rights reserved.
//

#import <UIKit/UIKit.h>
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
#define SPACE 10
#define ALERT_TABLEVIEW_HEIGHT (([UIScreen mainScreen].bounds.size.height < 568.0) ? 40.0 : 45.0)
typedef void(^btnClickBlock)(UIButton *btn, NSInteger tag);

@interface XTAlertStyleView : UITableViewCell
@property (nonatomic, strong) UIButton *btnLeft;
@property (nonatomic, strong) UIButton *btnRight;
@property (nonatomic, copy) btnClickBlock btnClickBlock;
@end

@interface XTAlterDoubleCell : UITableViewCell
@property (nonatomic, strong) UILabel *titleLabel;
@end