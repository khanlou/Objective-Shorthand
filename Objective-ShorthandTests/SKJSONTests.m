//
//  SKJSONTests.m
//  Objective-Shorthand
//
//  Created by Soroush Khanlou on 12/10/13.
//  Copyright (c) 2013 Soroush Khanlou. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSObject+JSON.h"

@interface SKJSONTests : XCTestCase

@end

@implementation SKJSONTests

- (void)testArraySerialization
{
    NSArray *array = @[@1, @2, @3];
    
    NSString *jsonString = [array JSONString];
    
    XCTAssert(jsonString.length > 0, @"should return a non-zero string");
}

- (void)testDictionarySerialization
{
    NSDictionary *dictionary = @{@"first": @1,
                                 @"second": @2,
                                 @"third": @3};
    
    NSString *jsonString = [dictionary JSONString];
    
    XCTAssert(jsonString.length > 0, @"should return a non-zero string");
}

- (void) testArrayDeserialization {
    NSString *jsonArrayString = @"[1,2,3]";
    
    id object = [jsonArrayString objectFromJSONString];
    
    XCTAssert([object respondsToSelector:@selector(count)], @"should respond to `count`");
    XCTAssert([object respondsToSelector:@selector(objectAtIndex:)], @"should respond to `objectAtIndex:`");
    XCTAssert([object count] == 3, @"should return 3 objects");
}

- (void) testDictionaryDeserialization {
    NSString *jsonDictionaryString = @"{\"second\":2,\"third\":3,\"first\":1}";
    
    id object = [jsonDictionaryString objectFromJSONString];
    
    XCTAssert([object respondsToSelector:@selector(count)], @"should respond to `count`");
    XCTAssert([object respondsToSelector:@selector(objectForKey:)], @"should respond to `objectAtIndex:`");
    XCTAssert([object count] == 3, @"should return 3 objects");
}

@end

