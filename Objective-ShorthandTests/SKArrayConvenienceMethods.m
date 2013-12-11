//
//  SKArrayConvenienceMethods.m
//  Objective-Shorthand
//
//  Created by Soroush Khanlou on 12/10/13.
//  Copyright (c) 2013 Soroush Khanlou. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSArray+Convenience.h"

@interface SKArrayConvenienceMethods : XCTestCase

@end

@implementation SKArrayConvenienceMethods

- (void)testUniquing
{
    NSArray *uniquedArray = [@[@1, @2, @2, @3] arrayByUniquingObjects];
    
    XCTAssert(uniquedArray.count == 3, @"The uniqued array should only have 3 elements in it");
}

@end
