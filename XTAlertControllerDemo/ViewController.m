//
//  ViewController.m
//  XTAlertControllerDemo
//
//  Created by Mac on 16/9/1.
//  Copyright © 2016年 夏天然后. All rights reserved.
//

#import "ViewController.h"
#import "XTAlertViewController/XTAlertView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@""]];
    NSArray *titles = @[@"Show Alter", @"Show Alter Though 3 Butttons"];
    for (int i = 0; i < 2; i ++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(0, 288 + 50 * i, self.view.frame.size.width, 50);
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
            [xt initWithImage:@"summerxx" imageHeight:150 title:@"This is an introduction" btnTitles:@[@"Cancel", @"Determine"] des:@"A simple and easy to use more version using the controls Copyright © 2016年 夏天然后. All rights reserved." style:AlterDefault];
            [self presentViewController:xt animated:YES completion:^{
                
            }];
        }
            break;
        case 101:
        {
            XTAlertViewController *xt = [[XTAlertViewController alloc] init];
            [xt initWithImage:@"summerxx" imageHeight:200 title:@"This is an introduction" btnTitles:@[@"Cancel", @"Determine", @"summerxx"] des:@"A simple and easy to use more version using the controls Copyright © 2016年 夏天然后. All rights reserved." style:AlterDouble];
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


@end
