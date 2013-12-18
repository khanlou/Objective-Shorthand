//
//  SKSetFunctionalMethodsTest.m
//  Objective-Shorthand
//
//  Created by Soroush Khanlou on 12/17/13.
//  Copyright (c) 2013 Soroush Khanlou. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSSet+FunctionalMethods.h"
#import "NSObject+ComparisonMethods.h"

@interface SKSetFunctionalMethodsTest : XCTestCase

@end

@implementation SKSetFunctionalMethodsTest

- (void) testSelectMethod
{
    NSSet *set = [NSSet setWithObjects:@1, @2, @3, nil];
    NSSet *newSet = [set setBySelectingObjectsPassingTest:^BOOL(id object) { return [object isGreaterThanOrEqualTo:@2]; }];
    
    XCTAssert(newSet.count == 2, @"two objects should be greater than or equal to 2");
}

- (void) testRejectMethod
{
    NSSet *set = [NSSet setWithObjects:@1, @2, @3, nil];
    NSSet *newSet = [set setByRejectingObjectsPassingTest:^BOOL(id object) { return [object isGreaterThanOrEqualTo:@2]; }];
    
    XCTAssert(newSet.count == 1, @"one object should be less than 2");
}

- (void) testMapMethod
{
    NSSet *set = [NSSet setWithObjects:@1, @2, @3, nil];
    NSSet *newSet = [set setByTransformingObjectsUsingBlock:^id(id object) { return @([object integerValue]*2); }];
    
    XCTAssert(newSet.count == set.count, @"map should return the same number of values as the original set");
    
    [set enumerateObjectsUsingBlock:^(id obj, BOOL *stop) {
        XCTAssert([newSet containsObject:@([obj integerValue]*2)], @"each item in the new set should be double the old set");
    }];
}

- (void) testMatchMethod {
    NSSet *set = [NSSet setWithObjects:@1, @2, @3, nil];
    
    id object = [set firstObjectPassingTest:^BOOL(id object) {
        return [object isGreaterThanOrEqualTo:@2];
    }];
    
    XCTAssert([object isGreaterThanOrEqualTo:@2], @"the first object greater than or equal to 2 should be 2");
}

- (void) testReduceMethod
{
    NSSet *set = [NSSet setWithObjects:@1, @2, @3, nil];
    NSNumber *sum = [set objectByReducingObjectsIntoAccumulator:@0 usingBlock:^id(id accumulator, id object) { return @([accumulator integerValue] + [object integerValue]); }];
    
    XCTAssert([sum integerValue] == 6, @"the sum of all items should equal 6");
}

- (void)testAnyMethod
{
    NSSet *set = [NSSet setWithObjects:@1, @2, @3, nil];
    BOOL any = [set anyObjectsPassTest:^BOOL(id object) { return [object isEqual:@1]; }];
    
    XCTAssertTrue(any, @"one object should equal 1");
}

- (void)testNoneMethod
{
    NSSet *set = [NSSet setWithObjects:@1, @2, @3, nil];
    BOOL none = [set noObjectsPassTest:^BOOL(id object) { return [object isEqual:@0]; }];
    
    XCTAssertTrue(none, @"no object should equal 0");
    
}

- (void)testAllMethod
{
    NSSet *set = [NSSet setWithObjects:@1, @2, @3, nil];
    BOOL all = [set allObjectsPassTest:^BOOL(id object) { return [object isGreaterThan:@0]; }];
    XCTAssertTrue(all, @"all objects should be greater than 0");
}

@end
