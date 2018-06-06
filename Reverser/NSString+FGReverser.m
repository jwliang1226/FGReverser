//
//  NSString+FGReverser.m
//  FGReverser
//
//  Created by 风过的夏 on 16/9/8.
//  Copyright © 2016年 xia. All rights reserved.
//

#import "NSString+FGReverser.h"
#import <objc/runtime.h>
#import "FGReverserConst.h"

@implementation NSString (FGReverser)

/**
 *  Mutual converting between Simplfied Chinese and traditional Chinese.
 *
 *  return the converted string
 */
-(NSString *)fg_reversed {
    NSDictionary *map = fg_mapper();
    NSMutableString *resultString=[NSMutableString stringWithString:[self copy]];
    for (NSInteger i=0; i<resultString.length; i++) {
        unichar c=[resultString characterAtIndex:i];
        NSString *key=[NSString stringWithFormat:@"%C",c];
        NSString *value=[map objectForKey:key];
        if(value) {
            [resultString deleteCharactersInRange:NSMakeRange(i, 1)];
            [resultString insertString:value atIndex:i];
        }
    }
    return resultString;
}

@end
