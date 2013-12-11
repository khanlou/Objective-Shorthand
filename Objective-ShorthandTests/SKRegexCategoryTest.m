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

- (void)testRegexWithOneCharacter
{
    NSString *string = @"Here's a test string";
    
    BOOL doesMatch = [string matchesRegex:@"t.st"];
    
    XCTAssertTrue(doesMatch, @"the string test should be found");
}


@end
