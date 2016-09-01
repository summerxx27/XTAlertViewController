## XTAlertView


Meaning is to create a more versions compatible with similar to UIAlertView controls
pic example:

![](http://ww4.sinaimg.cn/large/e6a4355cgw1f7e3c2t0mvj20jz0zkmyk.jpg)
![](http://ww1.sinaimg.cn/large/e6a4355cgw1f7e3cv8mv8j20ku112js8.jpg)
![](http://ww3.sinaimg.cn/large/e6a4355cgw1f7e3d0ucy1j20ku112jsm.jpg)
![](http://ww2.sinaimg.cn/large/e6a4355cgw1f7e3d5z1hbj20jz0zkmxx.jpg)

Gif example:

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
        
        // example 1
        [xt initWithImage:@"summerxx" imageHeight:0 title:@"This is an introduction" btnTitles:@[@"Cancel", @"Determine"] des:@"A simple and easy to use more version using the controls Copyright © 2016年 夏天然后. All rights reserved." style:AlterDefault];
        [self presentViewController:xt animated:YES completion:^{

        }];
        // example 2
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