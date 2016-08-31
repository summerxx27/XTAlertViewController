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
#define padding 10
#define ALERT_STACKVIEW_HEIGHT (([UIScreen mainScreen].bounds.size.height < 568.0) ? 40.0 : 60.0)
@interface XTDefaultCell : UITableViewCell

@end

@interface XTAlterDoubleCell : UITableViewCell
@property (nonatomic, strong) UIButton *button;
@end