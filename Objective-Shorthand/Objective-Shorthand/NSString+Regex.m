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
    return ([self matchesForRegex:regex].count > 0);
}

- (NSRange) rangeOfFirstSubstringMatching:(NSString*)regex {
    NSRegularExpression *regularExpression = [NSRegularExpression regularExpressionWithPattern:regex options:0 error:nil];
    return [regularExpression rangeOfFirstMatchInString:self options:0 range:NSMakeRange(0, self.length)];
}

- (NSArray*) matchesForRegex:(NSString *)regex {
    NSRegularExpression *regularExpression = [NSRegularExpression regularExpressionWithPattern:regex options:0 error:nil];
    return [regularExpression matchesInString:self options:0 range:NSMakeRange(0, self.length)];
}

@end
