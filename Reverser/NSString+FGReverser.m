//
//  NSString+FGReverser.m
//  FGReverser
//
//  Created by 风过的夏 on 16/9/8.
//  Copyright © 2016年 xia. All rights reserved.
//

#import "NSString+FGReverser.h"
#import <objc/runtime.h>

static const char *NSStringRevereMapperKey = "NSStringRevereMapperKey";

@implementation NSString (FGReverser)

- (NSDictionary *)reverseMap {
    return objc_getAssociatedObject(self, NSStringRevereMapperKey);
}
- (void)setReverseMap:(NSDictionary *)reverseMap {
    objc_setAssociatedObject(self, NSStringRevereMapperKey, reverseMap, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (NSDictionary *)mapper {
    if(!self.reverseMap) {
        NSString *mapPath = [[NSBundle mainBundle] pathForResource:@"reverse" ofType:nil];
        self.reverseMap = [NSDictionary dictionaryWithContentsOfFile:mapPath];
    }
    return self.reverseMap;
}
/**
 *  Mutual converting between Simplfied Chinese and traditional Chinese.
 *
 *  return the converted string
 */
-(NSString *)reverseString {
    NSDictionary *map = [self mapper];
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
