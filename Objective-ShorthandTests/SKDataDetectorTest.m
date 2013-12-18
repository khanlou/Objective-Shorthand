//
//  SKDataDetectorTest.m
//  Objective-Shorthand
//
//  Created by Soroush Khanlou on 12/17/13.
//  Copyright (c) 2013 Soroush Khanlou. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSString+DataDetector.h"

@interface SKDataDetectorTest : XCTestCase

@end

@implementation SKDataDetectorTest

- (void)testEmailDetection
{
    BOOL isEmail = [@"soroush@khanlou.com" isEmail];
    
    XCTAssertTrue(isEmail, @"isEmail should return YES for emails");
    
    BOOL isNotEmail = [@"soroush@khanlou.com " isEmail];
    
    XCTAssertFalse(isNotEmail, @"isEmail does not trim strings before checking");
    
    isNotEmail = [@"http://google.com" isEmail];
    
    XCTAssertFalse(isNotEmail, @"isEmail should return NO for URLs");
    
}

- (void)testURLDetection
{
    BOOL isURL = [@"http://google.com" isURL];
    
    XCTAssertTrue(isURL, @"isURL should return YES for URLs");
    
    isURL = [@"google.com" isURL];
    
    XCTAssertTrue(isURL, @"isURL should return YES for URLs with no scheme");
    
    BOOL isNotURL = [@"soroush@khanlou.com" isURL];
    
    XCTAssertFalse(isNotURL, @"isURL should return NO for email");
}

- (void)testPhoneNumberDetection
{
    //these tests are very america-centric right now but they just show that the API is calling through to the data detector correctly
    BOOL isPhoneNumber = [@"(347) 555-1234" isPhoneNumber];
    XCTAssertTrue(isPhoneNumber, @"isPhoneNumber should return YES for phone numbers");
    
    isPhoneNumber = [@"347-555-1234" isPhoneNumber];
    XCTAssertTrue(isPhoneNumber, @"isPhoneNumber should return YES for phone numbers");
    
    isPhoneNumber = [@"3475551234" isPhoneNumber];
    XCTAssertTrue(isPhoneNumber, @"isPhoneNumber should return YES for phone numbers");
    
    isPhoneNumber = [@"+13475551234" isPhoneNumber];
    XCTAssertTrue(isPhoneNumber, @"isPhoneNumber should return YES for phone numbers");
}

- (void)testDateDetection
{
    BOOL isDate = [@"12/1/98" isDate];
    XCTAssertTrue(isDate, @"isDate should return YES for dates");
    
    isDate = [@"next wednesday" isDate];
    XCTAssertTrue(isDate, @"isDate should return YES for relative dates");
    
    isDate = [@"Wed, 17 Apr 2013 10:15 +0300" isDate];
    XCTAssertTrue(isDate, @"isDate should return YES for dates");
    
    isDate = [@"17 Apr 2013 11:07:01 +0200" isDate];
    XCTAssertTrue(isDate, @"isDate should return YES for dates");
    
    isDate = [@"11/04/2013 18:10:10" isDate];
    XCTAssertTrue(isDate, @"isDate should return YES for dates");
}

- (void) testAddressDetection
{
    BOOL isAddress = [@"1600 Pennsylania Ave" isAddress];
    XCTAssertTrue(isAddress, @"isAddress should return YES for addresses");
}

@end
