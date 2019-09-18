//
//  XTAlterController.h
//  XTAlterViewController
//
//  Created by zjwang on 16/8/31.
//  Copyright © 2016年 夏天然后. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol XTAlertControllerDelegate <NSObject>

- (void)xt_alertViewControllerClickIndex:(NSInteger)buttonIndex;

@end

typedef NS_ENUM(NSInteger, XTAlertViewControllerStyle)
{
    AlertDefault = 0,
    AlertDouble  = 1,
};

@interface XTAlertViewController : UIViewController
/**
 *  init
 *
 *  @param image       pic name
 *  @param imageHeight pic height
 *  @param title       title text
 *  @param des         des text
 *  @param style       style AlterDefault | AlterDouble
 */
@property (nonatomic, assign) id<XTAlertControllerDelegate> delegate;
- (void)showViewWithImage:(NSString *)image imageHeight:(CGFloat)imageHeight title:(NSString *)title btnTitles:(NSArray *)titles des:(NSString *)des style:(XTAlertViewControllerStyle)style fromVC:(UIViewController *)fromVC;


@end
