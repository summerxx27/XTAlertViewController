## XTAlertView


Meaning is to create a more versions compatible with similar to UIAlertView controls

#### like this
```objectivec
        // init obj
        XTAlertViewController *xt = [[XTAlertViewController alloc] init];
        // Give a picture name
        // Give a picture's height
        // Give a btn's title array
        // Give a title
        // Give a describtion
        // Give a style  two btn | double btn
        

        // two
        [xt initWithImage:@"summerxx" imageHeight:0 title:@"This is an introduction" btnTitles:@[@"Cancel", @"Determine"] des:@"A simple and easy to use more version using the controls Copyright © 2016年 夏天然后. All rights reserved." style:AlterDefault];
        [self presentViewController:xt animated:YES completion:^{

        }];
        // double
        [xt initWithImage:@"summerxx" imageHeight:200 title:@"This is an introduction" btnTitles:@[@"Cancel", @"Determine", @"summerxx"] des:@"A simple and easy to use more version using the controls Copyright © 2016年 夏天然后. All rights reserved." style:AlterDouble];

        // present VC
        [self presentViewController:xt animated:YES completion:^{

        }];
```
#### If you use a proxy method 
```objectivec
    // Signed an delegate
    @interface ViewController ()<XTAlertControllerDelegate>
    // 
    xt.delegate = self;
```
#### Implement delegate method like this
```objectivec
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
```