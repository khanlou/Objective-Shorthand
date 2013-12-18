//
//  SKFunctionalMethodsTest.m
//  Objective-Shorthand
//
//  Created by Soroush Khanlou on 12/10/13.
//  Copyright (c) 2013 Soroush Khanlou. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSArray+FunctionalMethods.h"
#import "NSObject+ComparisonMethods.h"

@interface SKFunctionalMethodsTest : XCTestCase

@end

@implementation SKFunctionalMethodsTest

- (void) testSelectMethod
{
    NSArray *array = @[@1, @2, @3];
    NSArray *newArray = [array arrayBySelectingItemsPassingTest:^BOOL(id object) { return [object isGreaterThanOrEqualTo:@2]; }];
    
    XCTAssert(newArray.count == 2, @"two objects should be greater than or equal to 2");
}

- (void) testRejectMethod
{
    NSArray *array = @[@1, @2, @3];
    NSArray *newArray = [array arrayByRejectingItemsPassingTest:^BOOL(id object) { return [object isGreaterThanOrEqualTo:@2]; }];
    
    XCTAssert(newArray.count == 1, @"one object should be less than 2");
}

- (void) testMapMethod
{
    NSArray *array = @[@1, @2, @3];
    NSArray *newArray = [array arrayByTransformingObjectsUsingBlock:^id(id object) { return @([object integerValue]*2); }];
    
    XCTAssert(newArray.count == array.count, @"map should return the same number of values as the original array");
    
    [array enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        XCTAssert([obj isEqual:@([newArray[idx] integerValue]/2)], @"each item in the new array should be double the old array");
    }];
}

- (void) testMatchMethod {
    NSArray *array = @[@1, @2, @3];
    
    id object = [array firstObjectPassingTest:^BOOL(id object) {
        return [object isGreaterThanOrEqualTo:@2];
    }];
    
    XCTAssert([object isEqual:@2], @"the first object greater than or equal to 2 should be 2");
}

- (void) testSampleMethod {
    NSArray *array = @[@1, @2, @3];
    
    id randomObject = [array randomObject];
    
    XCTAssert([array containsObject:randomObject], @"random object must be contained within the array");
}

- (void) testReduceMethod
{
    NSArray *array = @[@1, @2, @3];
    NSNumber *sum = [array objectByReducingObjectsIntoAccumulator:@0 usingBlock:^id(id accumulator, id object) { return @([accumulator integerValue] + [object integerValue]); }];
    
    XCTAssert([sum integerValue] == 6, @"the sum of all items should equal 6");
}

- (void)testAnyMethod
{
    NSArray *array = @[@1, @2, @3];
    BOOL any = [array anyObjectsPassTest:^BOOL(id object) { return [object isEqual:@1]; }];
    
    XCTAssertTrue(any, @"one object should equal 1");
}

- (void)testNoneMethod
{
    NSArray *array = @[@1, @2, @3];
    BOOL none = [array noObjectsPassTest:^BOOL(id object) { return [object isEqual:@0]; }];
 
    XCTAssertTrue(none, @"no object should equal 0");

}

- (void)testAllMethod
{
    NSArray *array = @[@1, @2, @3];
    BOOL all = [array allObjectsPassTest:^BOOL(id object) { return [object isGreaterThan:@0]; }];
    XCTAssertTrue(all, @"all objects should be greater than 0");
}



@end
