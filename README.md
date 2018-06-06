# FGReverser
****

## Introduction
A Category of NSString used for mutual converting between simplified Chinese and Traditional Chinese.

## Installtion
- Manual:
Download This Project and drag the FGReverser folder into your peroject, do not forget to ensure "copy item if need" being selected.

- Cocoapods:
```
pod 'FGReverser', '~> 2.0'
```

## Usage
Just import the header file:`import "NSString+FGReverser.h"`

Simplfied Chinese to Traditional Chinese, or Traditional Chinese to Simplfied Chinese, Use:
```
-(NSString *)reverseString;
```
## Example
```
NSString *sourceString=@"恭喜发财";
NSString *reslutString=[sourceString fg_reversed];
NSLog(@"%@",reslutString);
```
The result is `恭喜發財`

NSString *sourceString=@"恭喜發財";
NSString *reslutString=[sourceString fg_reversed];
NSLog(@"%@",reslutString);
```
The result is `恭喜发财`

## About Me
- Blog:     [CGPointZeero](http://Insfgg99x.github.io)
- GitHub:   [Insfgg99x](https://github.com/Insfgg99x)
- Mooc:     [CGPointZero](http://www.imooc.com/u/3909164/articles)
- Jianshu:  [CGPointZero](http://www.jianshu.com/users/c3f2e8c87dc4/latest_articles)
- Email:    [newbox0512@yahoo.com](mailto:newbox0512@yahoo.com)

****

@CGPoitZero
