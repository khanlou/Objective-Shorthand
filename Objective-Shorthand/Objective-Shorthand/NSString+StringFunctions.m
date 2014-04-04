//
//  NSString+StringFunctions.m
//  Objective-Shorthand
//
//  Created by Brandon Gottlob on 12/21/13.
//  Copyright (c) 2013 Soroush Khanlou. All rights reserved.
//

#import "NSString+StringFunctions.h"

@implementation NSString (StringFunctions)

- (BOOL)contains:(NSString *)testString
{
    if ([self rangeOfString:testString].location == NSNotFound)
        return NO;
    else
        return YES;
}

- (BOOL)isEqualToStringIgnoringCase:(NSString *)otherString
{
    return [self caseInsensitiveCompare:otherString] == NSOrderedSame;
}

- (NSString *)stringByRemovingOccurrencesOfString:(NSString *)removeString
{
    return [self stringByReplacingOccurrencesOfString:removeString withString:@""];
}

@end
