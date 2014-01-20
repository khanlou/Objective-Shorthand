//
//  NSString+StringFunctions.h
//  Objective-Shorthand
//
//  Created by Brandon Gottlob on 12/21/13.
//  Copyright (c) 2013 Soroush Khanlou. All rights reserved.
//

#import <Foundation/Foundation.h>

///A category for implementing simple operations on NSString values
@interface NSString (StringFunction)

/**
 *  Returns whether the test string is contained within the receiver string.
 *
 *  @param testString The string to search for.
 *
 *  @return A boolean value telling whether the receiver contains the test string.
 */
- (BOOL)contains:(NSString *)testString;

/**
 *  Returns whether two strings are equal when ignoring case
 *
 *  @param otherString The string to be compared to the receiver string.
 *
 *  @return A boolean value telling whether two strings are the same when ignoring case.
 */
- (BOOL)isEqualToStringIgnoringCase:(NSString *)otherString;

/**
 *  Returns a string in which all occurrences of another string have been removed.
 *
 *  @param removeString The string that will be removed from the receiver.
 *
 *  @return The string that has had all occurrences of another string removed.
 */
- (NSString *)stringByRemovingOccurrencesOfString:(NSString *)removeString;

@end
