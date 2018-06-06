//
//  NSString+FGReverser.h
//  FGReverser
//
//  Created by 风过的夏 on 16/9/8.
//  Copyright © 2016年 xia. All rights reserved.
//
/*
 ##Introduction
 A Category of NSString used for mutual converting between simplified Chinese and Traditional Chinese.
 ##Usage
 - Simplfied Chinese to Traditional Chinese, or Traditional Chinese to Simplfied Chinese, Use:
 ```
 -(NSString *)reverseString;
 ```
 ##Example
 ```
 NSString *sourceString=@"恭喜发财";
 NSString *reslutString=[sourceString reverseString];
 NSLog(@"%@",reslutString);
 ```
 The result is `恭喜發財`
 ##About Me
 - Blog:     [CGPointZeero](http://cgpointzero.top)
 - GitHub:   [Insfgg99x](https://github.com/Insfgg99x)
 - Mooc:     [CGPointZero](http://www.imooc.com/u/3909164/articles)
 - Jianshu:  [CGPointZero](http://www.jianshu.com/users/c3f2e8c87dc4/latest_articles)
 - Email:    newbox0512@yahoo.com
 */

#import <Foundation/Foundation.h>

/**
 *  Mutual converting
 *
 */
@interface NSString (FGReverser)

/**
 *  Mutual converting between Simplfied Chinese and traditional Chinese.
 *
 *  return the converted string
 */
-(NSString *)fg_reversed;

@end
