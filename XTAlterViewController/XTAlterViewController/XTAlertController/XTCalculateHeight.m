//
//  XTCalculateHeight.m
//  XTAlterViewController
//
//  Created by zjwang on 16/8/31.
//  Copyright © 2016年 夏天然后. All rights reserved.
//

#import "XTCalculateHeight.h"

@implementation XTCalculateHeight
+ (CGFloat)XTHeightWithString:(NSString *)string width:(CGFloat)width fontSize:(NSInteger)fontsize
{
    CGSize size = CGSizeMake(width, 10000);
    NSDictionary *dic = @{NSFontAttributeName:[UIFont systemFontOfSize:fontsize]};
    CGRect rect  = [string boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil];
    return rect.size.height;
}
@end
