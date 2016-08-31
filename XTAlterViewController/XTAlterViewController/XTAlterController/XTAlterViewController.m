//
//  XTAlterController.m
//  XTAlterViewController
//
//  Created by zjwang on 16/8/31.
//  Copyright © 2016年 夏天然后. All rights reserved.
//

#import "XTAlterViewController.h"
#import "XTCalculateHeight.h"
#import "XTDefaultCell.h"
@class XTAlterAction;

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
#define padding 10
#define ALERT_STACKVIEW_HEIGHT (([UIScreen mainScreen].bounds.size.height < 568.0) ? 40.0 : 60.0)
@interface XTAlterViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, assign) XTAlterViewControllerStyle alterStyle;
@property (nonatomic, strong) UIView        *alterView;             // containView
@property (nonatomic, strong) UIImageView   *alterImage;            // pic
@property (nonatomic, strong) UILabel       *alterTitle;            // title
@property (nonatomic, strong) UILabel       *alterDes;              // des
@property (nonatomic, strong) UITableView   *tableViewList;   
@property (nonatomic, strong) UIStackView   *stackView;
@property (nonatomic, assign) CGFloat       imageHeight;
@property (nonatomic, assign) CGFloat       titleHeight;
@property (nonatomic, assign) CGFloat       desHeight;


@property (nonatomic, strong) NSArray *titles;

@end

@implementation XTAlterViewController
- (instancetype)init
{
    self = [super init];
    if (self) {
        
        self.view.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.1];
        
    }
    return self;
}
- (UIView *)alterView
{
    if (_alterView == nil) {
        _alterView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH * 0.75, SCREEN_HEIGHT * 0.75)];
        _alterView.backgroundColor = [UIColor lightGrayColor];
        _alterView.center = self.view.center;
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
- (UIStackView *)stackView
{
    if (_stackView == nil) {
        _stackView = [[UIStackView alloc] init];
        _stackView.backgroundColor = [UIColor greenColor];
    }
    return _stackView;
}
- (void)initWithImage:(NSString *)image imageHeight:(CGFloat)imageHeight title:(NSString *)title btnTitles:(NSArray *)titles des:(NSString *)des style:(XTAlterViewControllerStyle)style
{
    [self.view addSubview:self.alterView];
    [_alterView addSubview:self.alterImage];
    [_alterView addSubview:self.alterTitle];
    [_alterView addSubview:self.alterDes];
    _alterView.center = self.view.center;
    // 模态推出的方式
    self.modalPresentationStyle = UIModalPresentationOverCurrentContext;
    self.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    self.alterView.backgroundColor = [UIColor whiteColor];
    // ???
    self.imageHeight = [image isEqualToString:@""] ? self.imageHeight == 0.0 : self.imageHeight == imageHeight;
    self.alterImage.image = [UIImage imageNamed:image];
    _alterImage.frame = CGRectMake(0, padding, self.alterView.frame.size.width, self.imageHeight);
    
    self.titleHeight = [title isEqualToString:@""] ? self.titleHeight == 0.0 : [XTCalculateHeight XTHeightWithString:title width:self.alterView.frame.size.width fontSize:18];
    
    self.desHeight = [des isEqualToString:@""] ? self.desHeight == 0.0 : [XTCalculateHeight XTHeightWithString:des width:self.alterView.frame.size.width fontSize:18];
    
    // Adjust `title` `describe` width
    _alterTitle.frame = CGRectMake(0, self.imageHeight + padding + padding, self.alterView.frame.size.width, self.titleHeight);
    _alterTitle.textAlignment = NSTextAlignmentCenter;
    _alterTitle.numberOfLines = 0;
    _alterTitle.font = [UIFont fontWithName:@"Avenir-Heavy" size:17];
    _alterDes.frame = CGRectMake(0, self.imageHeight + self.titleHeight + padding * 3, self.alterView.frame.size.width, self.desHeight + 15);
    _alterDes.textAlignment = NSTextAlignmentCenter;
    _alterDes.numberOfLines = 0;
    _alterDes.font = [UIFont fontWithName:@"Avenir-Heavy" size:17];
    
    // add Text
    _alterTitle.text = title;
    _alterDes.text = des;
    // AlterView set`
    [self alterSet];
    
    
    _alterTitle.backgroundColor = [UIColor lightGrayColor];
    _alterDes.backgroundColor = [UIColor yellowColor];
    
    // style
    self.alterStyle = style;
    // init
    _tableViewList = [[UITableView alloc] initWithFrame:CGRectMake(0, self.imageHeight + self.desHeight + self.titleHeight + padding * 3 + 15, self.alterView.frame.size.width, 300) style:UITableViewStylePlain];
    _tableViewList.delegate = self;
    _tableViewList.dataSource = self;
    _tableViewList.separatorColor = [UIColor clearColor];
    [_tableViewList registerClass:[XTAlterDoubleCell class] forCellReuseIdentifier:@"cellID"];
    [_alterView addSubview:self.tableViewList];
    self.titles = titles;
    if (self.titles.count > 0) {
        [self.tableViewList reloadData];
    }
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
    switch (self.alterStyle) {
        case AlterDefault: {
            return 1;
            break;
        }
        case AlterDouble: {
            return self.titles.count;
            break;
        }
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (self.alterStyle) {
        case AlterDefault: {
            {
                XTDefaultCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellID_d"];
                
            }
            break;
        }
        case AlterDouble: {
            {
                XTAlterDoubleCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellID"];
                [cell.button setTitle:self.titles[indexPath.row] forState:UIControlStateNormal];
                return cell;
            }
            break;
        }
    }
    return nil;
}
@end
