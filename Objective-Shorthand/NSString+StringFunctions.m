//
//  NSString+StringFunctions.m
//  Objective-Shorthand
//
//  Created by Brandon Gottlob on 12/21/13.
//  Copyright (c) 2013 Soroush Khanlou. All rights reserved.
//

#import "NSString+StringFunctions.h"

@implementation NSString (StringFunctions)

-(BOOL)contains:(NSString *)testString
{
    if ([self rangeOfString:testString].location == NSNotFound)
        return FALSE;
    else
        return TRUE;
}

-(BOOL)isEqualToStringIgnoreCase:(NSString *)otherString
{
    //Converts both strings to upper case, then compares them
    NSString *s1 = [self uppercaseString];
    NSString *s2 = [otherString uppercaseString];
    
    if ([s1 isEqualToString:s2])
        return TRUE;
    else
        return FALSE;
}

-(NSString *)stringByRemovingOccurrencesOfString:(NSString *)removeString
{
    return [self stringByReplacingOccurrencesOfString:removeString withString:@""];
}

@end
