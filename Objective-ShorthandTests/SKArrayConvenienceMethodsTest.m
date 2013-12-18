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

@interface SKArrayConvenienceMethods : XCTestCase

@end

@implementation SKArrayConvenienceMethods

- (void)testUniquing
{
    NSArray *uniquedArray = [@[@1, @2, @2, @3] uniquedArray];
    
    XCTAssert(uniquedArray.count == 3, @"The uniqued array should only have 3 elements in it");
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
