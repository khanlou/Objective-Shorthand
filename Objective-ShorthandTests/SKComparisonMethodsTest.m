//
//  SKComparisonMethodsTest.m
//  Objective-Shorthand
//
//  Created by Soroush Khanlou on 12/10/13.
//  Copyright (c) 2013 Soroush Khanlou. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSObject+ComparisonMethods.h"

@interface SKComparisonMethodsTest : XCTestCase

@end

@implementation SKComparisonMethodsTest

- (void)testLessThan
{
    BOOL isLessThan = [@1 isLessThan:@3];
    XCTAssertTrue(isLessThan, @"1 should be less than 3");
}

- (void)testGreaterThan
{
    BOOL isGreaterThan = [@5 isGreaterThan:@2];
    XCTAssertTrue(isGreaterThan, @"5 should be greater than 2");
}

- (void)testEqualTo
{
    BOOL isEqual = [@3 isEqualTo:@3];
    XCTAssertTrue(isEqual, @"3 should be equal to 3");

    BOOL isNotEqual = [@6 isEqualTo:@3];
    XCTAssertFalse(isNotEqual, @"6 should not be equal to 3");
}

- (void)testLessThanOrEqualTo
{
    BOOL isLessThanOrEqualTo = [@1 isLessThanOrEqualTo:@3];
    XCTAssertTrue(isLessThanOrEqualTo, @"1 should be less than 3");
    
    BOOL isEqual = [@3 isLessThanOrEqualTo:@3];
    XCTAssertTrue(isEqual, @"3 should be equal to 3");
}

- (void)testGreaterThanOrEqualTo
{
    BOOL isGreaterThanOrEqualTo = [@3 isGreaterThanOrEqualTo:@1];
    XCTAssertTrue(isGreaterThanOrEqualTo, @"1 should be less than 3");
    
    BOOL isEqual = [@3 isGreaterThanOrEqualTo:@3];
    XCTAssertTrue(isEqual, @"3 should be equal to 3");
}

- (void)testNotEqual
{
    BOOL isNotEqual = [@1 isNotEqualTo:@3];
    XCTAssertTrue(isNotEqual, @"1 should not be equal to 3");
    
    BOOL isEqual = [@1 isNotEqualTo:@1];
    XCTAssertFalse(isEqual, @"1 should be equal to");

}

- (void) testDates {
    NSDate *now = [NSDate date];
    NSDate *aMinuteAgo = [now dateByAddingTimeInterval:-3600];
    XCTAssertTrue([now isGreaterThan:aMinuteAgo], @"Now should be greater than an hour ago");
}

- (void) testStrings {
    NSString *string = @"here's a string";
    NSString *otherString = @"here's a second string";
    
    XCTAssertTrue([string isGreaterThan:otherString], @"'string' should be 'greater' than 'second'");
}

- (void) testDictionaries {
    NSDictionary *dictionary = @{};
    NSDictionary *otherDictionary = @{@"thing": @"other thing"};
    
    XCTAssertThrows([dictionary isLessThanOrEqualTo:otherDictionary], @"NSDictionary does not respond to `compare:`!");
}

@end
