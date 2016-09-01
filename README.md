<div align=center>
<img src="http://ww1.sinaimg.cn/large/e6a4355cgw1f7e5n20i3gj20n5054q3r.jpg"/>
</div>

preface: Meaning is to create a more versions compatible with similar to UIAlertView controls
pic example:
<table border="1">
<tr>
    <td><img src="http://ww4.sinaimg.cn/large/e6a4355cgw1f7e3c2t0mvj20jz0zkmyk.jpg" width="200" height="300"></td>
    <td><img src="http://ww1.sinaimg.cn/large/e6a4355cgw1f7e3cv8mv8j20ku112js8.jpg" width="200" height="300"></td>
    <td><img src="http://ww3.sinaimg.cn/large/e6a4355cgw1f7e3d0ucy1j20ku112jsm.jpg" width="200" height="300"></td>
    <td><img src="http://ww2.sinaimg.cn/large/e6a4355cgw1f7e3d5z1hbj20jz0zkmxx.jpg" width="200" height="300"></td>
</tr>
</table>

Gif example:
<table border="1">
<tr>
<td><img src="http://ww4.sinaimg.cn/large/e6a4355cgw1f7e3sxauntg208w0gs4qq.gif" width="200" height="300"></td>
<td><img src="http://ww4.sinaimg.cn/large/e6a4355cgw1f7e3tdz4uug208w0gnkjp.gif" width="200" height="300"></td>
</tr>
</table>

### Advantages

- iOS 7.0 available after
- Header Image (optional)
- Title, des (optional)
- Low coupling (present new controller)
- Animation with UIKit Dynamics

### Features

- Provide the expansion of the more interesting and powerful features

#### Usage
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
### Contributing
- If you need help, open an issue.
- If you found a bug, open an issue.
- If you have a new demand, also open an issue.

### Acknowledgements
Made with by [summerxx27](https://github.com/summerxx27) , Thank you for your use

### MIT License
XTAlertController is available under the MIT license. See the LICENSE file for more info.