//
//  SKArrayConvenienceMethods.m
//  Objective-Shorthand
//
//  Created by Soroush Khanlou on 12/10/13.
//  Copyright (c) 2013 Soroush Khanlou. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSArray+Convenience.h"
#import "NSObject+ComparisonMethods.h"
#import "NSArray+FunctionalMethods.h"

@interface SKArrayConvenienceMethods : XCTestCase

@end

@implementation SKArrayConvenienceMethods

- (void)testFlattening {
    NSArray *originalArray = @[
                               @1,
                               @[@2, @2],
                               @[@3,
                                 @[@4, @5],
                                 ],
                               @3,
                               ];
    
    NSArray *flattenedArray = [originalArray flattenedArray];
    
    XCTAssert(flattenedArray.count == 7, @"Flattening an array should have all the elements of all subarrays");
    
    BOOL noObjectsAreArrays = [flattenedArray noObjectsPassTest:^BOOL(id object) {
        return [object isKindOfClass:[NSArray class]];
    }];
    XCTAssert(noObjectsAreArrays, @"A flattened array should not have any objects that are arrays.");
}

- (void)testUniquing
{
    NSArray *uniquedArray = [@[@1, @2, @2, @3] uniquedArray];
    
    XCTAssert(uniquedArray.count == 3, @"The uniqued array should only have 3 elements in it");
    XCTAssertEqualObjects(uniquedArray, (@[@1, @2, @3]), @"Uniqued arrays should maintain order.");
}

- (void)testSorting
{
    NSArray *sortedArray = [@[@3, @2, @1, @3] sortedArray];
    
    id lastValue = sortedArray.firstObject;
    for (id object in sortedArray) {
        XCTAssert([lastValue isLessThanOrEqualTo:object], @"each object in a sorted array must be less than or equal to the previous object");
    }
}

- (void)testReversal
{
    NSArray *originalArray = @[@3, @2, @1, @3];
    NSArray *reversedArray = [originalArray reversedArray];
    
    NSUInteger arrayLength = originalArray.count;
    
    [originalArray enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        XCTAssert([obj isEqual:reversedArray[(arrayLength - 1) - idx]], @"each item in the reversed array must correspond to its counterpart in the original array");
    }];
    
}
@end
