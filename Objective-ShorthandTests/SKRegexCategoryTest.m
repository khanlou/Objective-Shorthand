//
//  SKRegexCategoryTest.m
//  Objective-Shorthand
//
//  Created by Soroush Khanlou on 12/10/13.
//  Copyright (c) 2013 Soroush Khanlou. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSString+Regex.h"

@interface SKRegexCategoryTest : XCTestCase

@end

@implementation SKRegexCategoryTest

- (void)testBasicRegex
{
    NSString *string = @"Here's a test string";
    
    BOOL doesMatch = [string matchesRegex:@"test"];
    
    XCTAssertTrue(doesMatch, @"the string test should be found");
}

- (void)testRegexWithOneWildCardCharacter
{
    NSString *string = @"Here's a test string";
    
    BOOL doesMatch = [string matchesRegex:@"t.st"];
    
    XCTAssertTrue(doesMatch, @"the string test should be found");
}

- (void)testRangeOfFirstMatch
{
    NSString *string = @"Here's a test string";
    
    NSRange range = [string rangeOfFirstSubstringMatching:@"test"];
    
    XCTAssert(range.location != NSNotFound, @"the string test should be found");
    XCTAssert(range.length == 4, @"the length of the match should be the length of the regex");
}

- (void)testNonexistentMatch
{
    NSString *string = @"Here's a test string";
    
    BOOL doesMatch = [string matchesRegex:@"dafsdafa"];
    
    XCTAssertFalse(doesMatch, @"the string test should not be found");
}

@end
