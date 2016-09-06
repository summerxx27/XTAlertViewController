//
//  ViewController.m
//  XTAlertDemo
//
//  Created by zjwang on 16/9/2.
//  Copyright © 2016年 夏天然后. All rights reserved.
//

#import "ViewController.h"
#import "XTAlertView.h"
@interface ViewController ()<UITableViewDataSource, UITableViewDelegate, XTAlertControllerDelegate>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *lineArray;
@end


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor blackColor];
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 100) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.rowHeight = 50;
    _tableView.dataSource = self;
    _tableView.center = self.view.center;
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cellID"];
    [self.view addSubview:_tableView];
    
    self.lineArray = @[@"Show Default Alert", @"Show Double Alert"];
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellID"];
    cell.backgroundColor = [UIColor colorWithRed:0.2053 green:0.7635 blue:1.0 alpha:1.0];
    cell.textLabel.text = self.lineArray[indexPath.row];
    cell.textLabel.font = [UIFont fontWithName:@"Avenir-Heavy" size:18];
    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        // example 1
        [[XTAlertViewController new] showViewWithImage:@"summerxx" imageHeight:188 title:@"This is an introduction" btnTitles:@[@"Cancel", @"Determine"] des:@"A simple and easy to use more version using the controls Copyright © 2016年 夏天然后. All rights reserved." style:AlertDefault fromVC:self];
        
    }else
    {
        XTAlertViewController *xtAlert = [[XTAlertViewController alloc] init];
        [xtAlert showViewWithImage:@"summerxx" imageHeight:188 title:@"This is an introduction" btnTitles:@[@"Cancel", @"Determine", @"Okey"] des:@"A simple and easy to use more version using the controls Copyright © 2016年 夏天然后. All rights reserved." style:AlertDouble fromVC:self];
        xtAlert.delegate = self;
    }
}
#pragma mark -
- (void)xt_alertViewControllerClickIndex:(NSInteger)buttonIndex
{
    
    switch (buttonIndex) {
        case 0:
            NSLog(@"0");
            NSLog(@"Cancel");
            break;
        case 1:
            NSLog(@"1");
            NSLog(@"Determine");
            break;
        case 2:
            NSLog(@"2");
            NSLog(@"summerxx");
            break;
        default:
            break;
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
