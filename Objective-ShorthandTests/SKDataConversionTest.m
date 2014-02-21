//
//  SKDataConversionTest.m
//  Objective-Shorthand
//
//  Created by Soroush Khanlou on 2/20/14.
//  Copyright (c) 2014 Soroush Khanlou. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSString+DataConversion.h"

@interface SKDataConversionTest : XCTestCase

@end

@implementation SKDataConversionTest



- (void)testDataConversion
{
    NSString *testString = @"here's a test string";
    NSData *dataRepresentation = [testString dataRepresentation];
    NSString *stringRepresentation = [dataRepresentation stringRepresentation];
    
    XCTAssertEqualObjects(testString, stringRepresentation, @"Converting to NSData and back should result in equal strings");
}

@end
