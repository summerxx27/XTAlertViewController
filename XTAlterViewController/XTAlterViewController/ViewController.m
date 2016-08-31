//
//  ViewController.m
//  XTAlterViewController
//
//  Created by zjwang on 16/8/31.
//  Copyright © 2016年 夏天然后. All rights reserved.
//

#import "ViewController.h"
#import "XTAlterController/XTAlterViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"aaa.jpg"]];
    NSArray *titles = @[@"Show Alter", @"Show Alter 3 Butttons"];
    for (int i = 0; i < 2; i ++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(0, 300 + 50 * i, self.view.frame.size.width, 50);
        btn.backgroundColor = [UIColor orangeColor];
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
            XTAlterViewController *xt = [[XTAlterViewController alloc] init];
            
            [xt initWithImage:@"aaa.jpg" imageHeight:100 title:@"title" btnTitles:@[@"Cancel", @"Allow"] des:@"Enables access to your location: discover what you can do when you're traveling and what is available near you." style:AlterDouble];
            
            [self presentViewController:xt animated:YES completion:^{
                //
            }];
        }
            break;
        case 101:
        {
            
        }
        default:
            break;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
