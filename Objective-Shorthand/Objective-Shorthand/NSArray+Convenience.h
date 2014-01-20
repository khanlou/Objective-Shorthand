//
//  NSArray+Convenience.h
//  Objective-Shorthand
//
//  Created by Soroush Khanlou on 12/10/13.
//  Copyright (c) 2013 Soroush Khanlou. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (Convenience)

/**
 *  Returns an a new array with duplicate objects removed.
 *
 *  The new array contains references to the receiving array’s elements, not copies of them.
 *
 *  Duplicates are determined by the `isEqual:` method.
 *
 *  @return A new array with duplicate objects removed.
 */
- (NSArray*)uniquedArray;

/**
 *  Returns an array that lists the receiving array’s elements in ascending order, as determined by the `compare:` method. All objects must respond to the `compare:` method, or an exception will be thrown.
 *
 *  The new array contains references to the receiving array’s elements, not copies of them.
 *
 *  @return A new array with values in ascending order.
 */
- (NSArray*) sortedArray;

/**
 *  Returns an array that lists the receiving array’s elements in reverse order.
 *
 *  The new array contains references to the receiving array’s elements, not copies of them.
 *
 *  @return A new array with values in reversed order.
 */
- (NSArray*) reversedArray;

/**
 *  Returns an array containing all the objects of subarrays in the same order.
 *
 *  The new array contains references to the receiving array’s elements, not copies of them.
 *
 *  @return A new array with subarray objects brought up to the top level.
 */
- (NSArray*) flattenedArray;

@end