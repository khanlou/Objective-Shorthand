//
//  NSString+Regex.m
//  Objective-Shorthand
//
//  Created by Soroush Khanlou on 12/10/13.
//  Copyright (c) 2013 Soroush Khanlou. All rights reserved.
//

#import "NSString+Regex.h"

@implementation NSString (Regex)

- (BOOL) matchesRegex:(NSString*)regex {
    NSRegularExpression *regularExpression = [NSRegularExpression regularExpressionWithPattern:regex options:0 error:nil];
    NSUInteger numberOfMatches = [regularExpression numberOfMatchesInString:self options:0 range:NSMakeRange(0, self.length)];
    return numberOfMatches > 0;
}

@end
