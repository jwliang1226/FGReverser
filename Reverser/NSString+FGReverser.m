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
static const char *NSStringRevereMapper2Key = "NSStringRevereMapper2Key";

@implementation NSString (FGReverser)

- (NSDictionary *)reverseMap {
    return objc_getAssociatedObject(self, NSStringRevereMapperKey);
}
- (void)setReverseMap:(NSDictionary *)reverseMap {
    objc_setAssociatedObject(self, NSStringRevereMapperKey, reverseMap, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (NSDictionary *)reverseMap2 {
    return objc_getAssociatedObject(self, NSStringRevereMapper2Key);
}
- (void)setReverseMap2:(NSDictionary *)reverseMap2 {
    objc_setAssociatedObject(self, NSStringRevereMapper2Key, reverseMap2, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (NSDictionary *)mapper {
    if(!self.reverseMap) {
        NSString *mapPath = [NSBundle.mainBundle pathForResource:@"Frameworks/FGReverser.framework/reverse" ofType:nil];
        self.reverseMap = [NSDictionary dictionaryWithContentsOfFile:mapPath];
    }
    return self.reverseMap;
}
- (NSDictionary *)remapper {
    if(!self.reverseMap2) {
        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
        for(NSString *key in self.reverseMap.allKeys) {
            id value = self.reverseMap[key];
            [dict setValue:key forKey:value];
        }
        self.reverseMap2 = [NSDictionary dictionaryWithDictionary:dict];
    }
    return self.reverseMap2;
}
/**
 *  Mutual converting between Simplfied Chinese and traditional Chinese.
 *
 *  return the converted string
 */
-(NSString *)fg_reversed {
    NSDictionary *map = [self mapper];
    NSDictionary *remap = [self remapper];
    NSMutableString *resultString=[NSMutableString stringWithString:[self copy]];
    for (NSInteger i=0; i<resultString.length; i++) {
        unichar c=[resultString characterAtIndex:i];
        NSString *key=[NSString stringWithFormat:@"%C",c];
        NSString *value=[map objectForKey:key];
        if(!value) {
            value = [remap objectForKey:key];
        }
        if(value) {
            [resultString deleteCharactersInRange:NSMakeRange(i, 1)];
            [resultString insertString:value atIndex:i];
        }
    }
    return resultString;
}

@end
