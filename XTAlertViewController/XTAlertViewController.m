//
//  XTAlterController.m
//  XTAlterViewController
//
//  Created by zjwang on 16/8/31.
//  Copyright © 2016年 夏天然后. All rights reserved.
//

#import "XTAlertViewController.h"
#import "XTCalculateHeight.h"
#import "XTAlertStyleView.h"
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
#define SPACE 10
#define ALERT_TABLEVIEW_HEIGHT (([UIScreen mainScreen].bounds.size.height < 568.0) ? 40.0 : 45.0)
@interface XTAlertViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, assign) XTAlertViewControllerStyle alertStyle;
@property (nonatomic, strong) UIView        *alterView;
@property (nonatomic, strong) UIImageView   *alterImage;
@property (nonatomic, strong) UILabel       *alterTitle;
@property (nonatomic, strong) UILabel       *alterDes;             
@property (nonatomic, strong) UITableView   *tableViewList;
@property (nonatomic, assign) CGFloat       imageHeight;
@property (nonatomic, assign) CGFloat       titleHeight;
@property (nonatomic, assign) CGFloat       desHeight;
@property (nonatomic, assign) CGFloat       tbHeight;
@property (nonatomic, strong) NSArray       *titles;
@property (nonatomic, strong) UIDynamicAnimator *animator;

@end

@implementation XTAlertViewController
- (instancetype)init
{
    self = [super init];
    if (self) {
        
        self.view.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.1];
        self.imageHeight = 0.0;
    }
    return self;
}
- (UIView *)alterView
{
    if (_alterView == nil) {
        _alterView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH * 0.75, SCREEN_HEIGHT * 0.75)];
    }
    return _alterView;
}
- (UIImageView *)alterImage
{
    if (_alterImage == nil) {
        _alterImage = [[UIImageView alloc] init];
    }
    return _alterImage;
}
- (UILabel *)alterTitle
{
    if (_alterTitle == nil) {
        _alterTitle = [[UILabel alloc] init];
    }
    return _alterTitle;
}
- (UILabel *)alterDes
{
    if (_alterDes == nil) {
        _alterDes = [[UILabel alloc] init];
    }
    return _alterDes;
}
- (void)showViewWithImage:(NSString *)image imageHeight:(CGFloat)imageHeight title:(NSString *)title btnTitles:(NSArray *)titles des:(NSString *)des style:(XTAlertViewControllerStyle)style fromVC:(UIViewController *)fromVC
{
    [self.view addSubview:self.alterView];
    [_alterView addSubview:self.alterImage];
    [_alterView addSubview:self.alterTitle];
    [_alterView addSubview:self.alterDes];
    _alterView.center = self.view.center;
    // `Modal way`
    self.modalPresentationStyle = UIModalPresentationOverCurrentContext;
    self.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    self.alterView.backgroundColor = [UIColor whiteColor];

    if (imageHeight != 0.0) {
        self.imageHeight = imageHeight;
    }
    _alterImage.frame = CGRectMake(5, SPACE, self.alterView.frame.size.width - 10, self.imageHeight);
    self.alterImage.image = [UIImage imageNamed:image];
    
    self.titleHeight = [title isEqualToString:@""] ? self.titleHeight == 0.0 : [XTCalculateHeight XTHeightWithString:title width:self.alterView.frame.size.width fontSize:18];
    
    self.desHeight = [des isEqualToString:@""] ? self.desHeight == 0.0 : [XTCalculateHeight XTHeightWithString:des width:self.alterView.frame.size.width fontSize:18];
    
    // Adjust `title` `describe` width
    _alterTitle.frame = CGRectMake(0, self.imageHeight + SPACE + SPACE, self.alterView.frame.size.width, self.titleHeight);
    _alterTitle.textColor = [UIColor colorWithRed:1.0 green:0.6709 blue:0.0953 alpha:1.0];
    _alterTitle.textAlignment = NSTextAlignmentCenter;
    _alterTitle.numberOfLines = 0;
    _alterTitle.font = [UIFont fontWithName:@"Avenir-Heavy" size:17];
    _alterDes.frame = CGRectMake(0, self.imageHeight + self.titleHeight + SPACE * 3, self.alterView.frame.size.width, self.desHeight + 15);
    _alterDes.textAlignment = NSTextAlignmentCenter;
    _alterDes.numberOfLines = 0;
    _alterDes.font = [UIFont fontWithName:@"Avenir-Heavy" size:17];
    
    // `add Text`
    _alterTitle.text = title;
    _alterDes.text = des;
    // `AlterView set`
    [self alterSet];
    
    // `style`
    self.alertStyle = style;
    // `init`
    switch (self.alertStyle) {
        case AlertDefault: {
            {
                self.tbHeight = ALERT_TABLEVIEW_HEIGHT;
            }
            break;
        }
        case AlertDouble: {
            {
                self.tbHeight = ALERT_TABLEVIEW_HEIGHT * titles.count;
            }
            break;
        }
    }
    _tableViewList = [[UITableView alloc] initWithFrame:CGRectMake(0, self.imageHeight + self.desHeight + self.titleHeight + SPACE * 3 + 15 + 10, self.alterView.frame.size.width, self.tbHeight) style:UITableViewStylePlain];
    _tableViewList.bounces = NO;
    _tableViewList.delegate = self;
    _tableViewList.dataSource = self;
    _tableViewList.rowHeight = ALERT_TABLEVIEW_HEIGHT;
    _tableViewList.separatorColor = [UIColor clearColor];
    [_tableViewList registerClass:[XTAlterDoubleCell class] forCellReuseIdentifier:@"cellID"];
    [_tableViewList registerClass:[XTAlertStyleView class] forCellReuseIdentifier:@"cellID_Default"];
    [_alterView addSubview:self.tableViewList];
    self.titles = titles;
    if (self.titles.count > 0) {
        [self.tableViewList reloadData];
    }
    
    _alterView.frame = CGRectMake(0, 0, SCREEN_WIDTH * 0.75, _tableViewList.frame.origin.y + self.tbHeight);
    _alterView.center = self.view.center;
    
    [fromVC presentViewController:self animated:YES completion:^{
        //
    }];
}
#pragma mark -
- (void)alterSet
{
    _alterView.layer.cornerRadius = 5;
    _alterView.layer.masksToBounds = NO;
    _alterView.layer.shadowOffset = CGSizeMake(0, 0);
    _alterView.layer.shadowRadius = 8;
    _alterView.layer.shadowOpacity = 0.3;
}

#pragma mark - 

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch (self.alertStyle) {
        case AlertDefault: {
            return 1;
            break;
        }
        case AlertDouble: {
            return self.titles.count;
            break;
        }
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (self.alertStyle) {
        case AlertDefault: {
            {
                XTAlertStyleView *cell = [tableView dequeueReusableCellWithIdentifier:@"cellID_Default"];
                [cell.btnLeft setTitle:self.titles.firstObject forState:UIControlStateNormal];
                [cell.btnRight setTitle:self.titles.lastObject forState:UIControlStateNormal];
                
                cell.btnClickBlock = ^(UIButton *btn,NSInteger tag)
                {
                    if (self.delegate != nil && [self.delegate respondsToSelector:@selector(xt_alertViewControllerClickIndex:)]) {
                        [self.delegate xt_alertViewControllerClickIndex:tag];
                    }
                    tableView.delegate = nil;
                    [self dissAlterView: tag];
                    };
                return cell;
            }
            break;
        }
        case AlertDouble: {
            {
                XTAlterDoubleCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellID"];
                cell.titleLabel.text = self.titles[indexPath.row];
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
                return cell;
            }
            break;
        }
    }
    return nil;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.delegate != nil && [self.delegate respondsToSelector:@selector(xt_alertViewControllerClickIndex:)]) {
        [self.delegate xt_alertViewControllerClickIndex:indexPath.row];
    }
    [self dissAlterView: indexPath.row];
}
- (void)dissAlterView:(NSInteger)dir
{
    double radian = M_PI;
    if (dir % 2 == 0) {
        radian = 2 * M_PI;
    }else{
        radian = -2 * M_PI;
    }
    _animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    
    UIGravityBehavior *grBehavior = [[UIGravityBehavior alloc] initWithItems:@[self.alterView]];
    grBehavior.gravityDirection = CGVectorMake(0, 8);
    [_animator addBehavior:grBehavior];
    
    UIDynamicItemBehavior *dyBehavior = [[UIDynamicItemBehavior alloc] initWithItems:@[self.alterView]];
    [dyBehavior addAngularVelocity:radian forItem:self.alterView];
    [_animator addBehavior:dyBehavior];
    
    [self dismissViewControllerAnimated:YES completion:^{

    }];
}
@end
