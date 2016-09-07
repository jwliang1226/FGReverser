//
//  NSString+FGReverser.m
//  FGReverser
//
//  Created by 风过的夏 on 16/9/8.
//  Copyright © 2016年 xia. All rights reserved.
//

#import "NSString+FGReverser.h"

@implementation NSString (FGReverser)

/**
 *  Mutual converting between Simplfied Chinese and traditional Chinese.
 *
 *  return the converted string
 */
-(NSString *)reverseString{
    
    NSString *mapPath=[[NSBundle mainBundle] pathForResource:@"reverse" ofType:nil];
    NSDictionary *map=[NSDictionary dictionaryWithContentsOfFile:mapPath];
    NSMutableString *resultString=[NSMutableString stringWithString:[self copy]];
    
    for (NSInteger i=0; i<resultString.length; i++){
        
        unichar c=[resultString characterAtIndex:i];
        NSString *key=[NSString stringWithFormat:@"%C",c];
        NSString *value=[map objectForKey:key];
        if(value){
            
            [resultString deleteCharactersInRange:NSMakeRange(i, 1)];
            [resultString insertString:value atIndex:i];
        }
    }
    return resultString;
}

@end
