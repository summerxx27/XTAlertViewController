//
//  XTCalculateHeight.h
//  XTAlterViewController
//
//  Created by zjwang on 16/8/31.
//  Copyright © 2016年 夏天然后. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface XTCalculateHeight : NSObject
+ (CGFloat)XTHeightWithString:(NSString *)string
                        width:(CGFloat)width
                     fontSize:(NSInteger)fontsize;
@end
