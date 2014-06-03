//
//  NSString+Regex.h
//  Objective-Shorthand
//
//  Created by Soroush Khanlou on 12/10/13.
//  Copyright (c) 2013 Soroush Khanlou. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Regex)

/**
 *  Returns whether the string matches regular expression pattern.
 *
 *  @param regex The regular expression pattern to match against.
 *
 *  @return A BOOL describing whether the pattern matches the string it was called on.
 */
- (BOOL) matchesRegex:(NSString*)regex;

/**
 *  Returns the range of the first substring matching a regular expression pattern.
 *
 *  @param regex The regular expression pattern to match against.
 *
 *  @return The range of the first substring within the text matching the regex.
 */
- (NSRange) rangeOfFirstSubstringMatching:(NSString*)regex;

/**
 *  Returns an array of NSTextMatchingResults within the receiver
 *
 *  @param regex The regular expression pattern to match against.
 *
 *  @return An array of NSTextMatchingResults containing the matches from the receiver.
 */
- (NSArray*) matchesForRegex:(NSString*)regex;

@end
