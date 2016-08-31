//
//  XTAlterController.h
//  XTAlterViewController
//
//  Created by zjwang on 16/8/31.
//  Copyright © 2016年 夏天然后. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef NS_ENUM(NSInteger, XTAlterViewControllerStyle)
{
    AlterDefault = 0,
    AlterDouble  = 1,
};

@interface XTAlterViewController : UIViewController
/**
 *  init
 *
 *  @param image       image name
 *  @param imageHeight image height
 *  @param title       title description
 *  @param des         des description
 *  @param style       style XTAlterViewControllerStyle
 */
- (void)initWithImage:(NSString *)image imageHeight:(CGFloat)imageHeight title:(NSString *)title btnTitles:(NSArray *)titles des:(NSString *)des style:(XTAlterViewControllerStyle)style;


@end
