//
//  NSString+Regex.h
//  Objective-Shorthand
//
//  Created by Soroush Khanlou on 12/10/13.
//  Copyright (c) 2013 Soroush Khanlou. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Regex)

- (BOOL) matchesRegex:(NSString*)regex;
- (NSRange) rangeOfFirstSubstringMatching:(NSString*)regex;

@end
