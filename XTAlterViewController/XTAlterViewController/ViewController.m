//
//  ViewController.m
//  XTAlterViewController
//
//  Created by zjwang on 16/8/31.
//  Copyright © 2016年 夏天然后. All rights reserved.
//

#import "ViewController.h"
#import "XTAlterController/XTAlertView.h"
@interface ViewController ()<XTAlertControllerDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@""]];
    NSArray *titles = @[@"Show Alter", @"Show Alter Though 3 Butttons"];
    for (int i = 0; i < 2; i ++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(0, 300 + 50 * i, self.view.frame.size.width, 50);
        btn.backgroundColor = [UIColor colorWithRed:0.2216 green:0.8117 blue:1.0 alpha:1.0];
        [btn setTitle:titles[i] forState:UIControlStateNormal];
        [self.view addSubview:btn];
        btn.tag = 100 + i;
        [btn addTarget:self action:@selector(clickAction:) forControlEvents:UIControlEventTouchUpInside];
    }
}

- (void)clickAction:(UIButton *)btn
{
    NSInteger tag = btn.tag;
    switch (tag) {
        case 100:
        {
            XTAlertViewController *xt = [[XTAlertViewController alloc] init];
            [xt initWithImage:@"flag" imageHeight:0 title:@"Locate your device" btnTitles:@[@"Cancel", @"Determine"] des:@"Enables access to your location: discover what you can do when you're traveling and what is available near you." style:AlterDefault];
            [self presentViewController:xt animated:YES completion:^{
                
            }];
        }
            break;
        case 101:
        {
            XTAlertViewController *xt = [[XTAlertViewController alloc] init];
            [xt initWithImage:@"flag" imageHeight:200 title:@"Locate your device" btnTitles:@[@"Cancel", @"Determine", @"summerxx"] des:@"Enables access to your location: discover what you can do when you're traveling and what is available near you." style:AlterDouble];
            xt.delegate = self;
            [self presentViewController:xt animated:YES completion:^{
                
            }];
        }
        default:
            break;
    }
}
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
