//
//  SKDictionaryFunctionalMethodsTest.m
//  Objective-Shorthand
//
//  Created by Soroush Khanlou on 12/17/13.
//  Copyright (c) 2013 Soroush Khanlou. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSObject+ComparisonMethods.h"
#import "NSDictionary+FunctionalMethods.h"

@interface SKDictionaryFunctionalMethodsTest : XCTestCase

@end

@implementation SKDictionaryFunctionalMethodsTest

- (void) testSelectMethod
{
    NSDictionary *dictionary = @{@"one": @1,
                                 @"two": @2,
                                 @"three": @3};
    NSDictionary *newDictionary = [dictionary dictionaryBySelectingKeysAndValuesPassingTest:^BOOL(id key, id value) {
        return [value isGreaterThanOrEqualTo:@2];
    }];
    
    XCTAssert(newDictionary.count == 2, @"two objects should be greater than or equal to 2");
}

- (void) testRejectMethod
{
    NSDictionary *dictionary = @{@"one": @1,
                                 @"two": @2,
                                 @"three": @3};
    NSDictionary *newDictionary = [dictionary dictionaryByRejectingKeysAndValuesPassingTest:^BOOL(id key, id value) {
        return [value isGreaterThanOrEqualTo:@2];
    }];
    
    XCTAssert(newDictionary.count == 1, @"one object should be less than 2");
}

- (void) testMapMethod
{
    NSDictionary *dictionary = @{@"one": @1,
                                 @"two": @2,
                                 @"three": @3};
    NSDictionary *newDictionary = [dictionary dictionaryByTransformingValuesUsingBlock:^id(id key, id value) {
        return @([value integerValue]*2);
    }];
    
    XCTAssert(newDictionary.count == dictionary.count, @"map should return the same number of values as the original dictionary");
    
    [dictionary enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        XCTAssert([obj isEqual:@([newDictionary[key] integerValue]/2)], @"each item in the new dictionary should be double the old dictionary");
    }];
}

- (void) testMatchMethod {
    NSDictionary *dictionary = @{@"one": @1,
                                 @"two": @2,
                                 @"three": @3};
    
    id keyForFirstValuePassingTest = [dictionary keyForFirstValuePassingTest:^BOOL(id key, id value) {
        return [value isGreaterThanOrEqualTo:@2];
    }];
    
    XCTAssert([dictionary[keyForFirstValuePassingTest] isEqual:@2], @"the first object greater than or equal to 2 should be 2");
}

- (void) testSampleMethod {
    NSDictionary *dictionary = @{@"one": @1,
                                 @"two": @2,
                                 @"three": @3};
    
    id randomObject = [dictionary randomKey];
    
    XCTAssert([dictionary.allKeys containsObject:randomObject], @"random object must be contained within the dictionary");
}

- (void) testReduceMethod
{
    NSDictionary *dictionary = @{@"one": @1,
                                 @"two": @2,
                                 @"three": @3};
    NSNumber *sum = [dictionary objectByReducingKeysAndValuesIntoAccumulator:@0 usingBlock:^id(id accumulator, id key, id value) {
        return @([accumulator integerValue] + [value integerValue]);
    }];
    
    XCTAssert([sum integerValue] == 6, @"the sum of all values should equal 6");
}

- (void)testAnyMethod
{
    NSDictionary *dictionary = @{@"one": @1,
                                 @"two": @2,
                                 @"three": @3};
    BOOL any = [dictionary anyKeyValuePairsPassTest:^BOOL(id key, id value) { return [value isEqual:@1]; }];
    
    XCTAssertTrue(any, @"one object should equal 1");
}

- (void)testNoneMethod
{
    NSDictionary *dictionary = @{@"one": @1,
                                 @"two": @2,
                                 @"three": @3};
    BOOL none = [dictionary noKeyValuePairsPassTest:^BOOL(id key, id value) { return [value isEqual:@0]; }];
    
    XCTAssertTrue(none, @"no object should equal 0");
    
}

- (void)testAllMethod
{
    NSDictionary *dictionary = @{@"one": @1,
                                 @"two": @2,
                                 @"three": @3};
    BOOL all = [dictionary allKeyValuePairsPassTest:^BOOL(id key, id value) { return [value isGreaterThan:@0]; }];
    XCTAssertTrue(all, @"all objects should be greater than 0");
}

@end
