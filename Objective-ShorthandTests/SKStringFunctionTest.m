//
//  SKStringFunctionTest.m
//  Objective-Shorthand
//
//  Created by Brandon Gottlob on 12/21/13.
//  Copyright (c) 2013 Soroush Khanlou. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSString+StringFunctions.h"

@interface SKStringFunctionTest : XCTestCase

@end

@implementation SKStringFunctionTest

-(void)testContains
{
    BOOL doesContain = [@"Hamburger" contains:@"burger"];
    
    XCTAssertTrue(doesContain, @"doesContain should return YES when the parameter string is contained in the receiver");
    
    BOOL doesNotContain = [@"Hamburger" contains:@"burgers"];
    
    XCTAssertFalse(doesNotContain, @"The string Hamburger does not contain burgers");
}

-(void)testIsEqualToStringIgnoringCase
{
    BOOL isEqual = [@"HeLlO" isEqualToStringIgnoringCase:@"hello"];
    
    XCTAssertTrue(isEqual, @"These two strings contain the same characters of different cases so they are equal");
    
    BOOL isNotEqual = [@"HeLlO" isEqualToStringIgnoringCase:@"hello "];
    
    XCTAssertFalse(isNotEqual, @"These strings are not equal because the second string ends with a space");
}

-(void)testStringByRemovingOccurrencesOfString
{
    NSString *removedLs = [@"hello" stringByRemovingOccurrencesOfString:@"l"];
    
    BOOL testSucceeded = [removedLs isEqualToString:@"heo"];
    
    XCTAssertTrue(testSucceeded, @"The removedLs string should equal heo since the method removes all l's");
    
    NSString *removedNothing = [@"hello" stringByRemovingOccurrencesOfString:@"b"];
    
    testSucceeded = [removedNothing isEqualToString:@"hello"];
    
    XCTAssertTrue(testSucceeded, @"None of the characters should have been removed because b is not contained within the string hello");
}

@end
