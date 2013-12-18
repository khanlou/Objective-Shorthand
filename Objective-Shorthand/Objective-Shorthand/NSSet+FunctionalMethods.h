//
//  NSSet+FunctionalMethods.h
//  Objective-Shorthand
//
//  Created by Soroush Khanlou on 12/17/13.
//  Copyright (c) 2013 Soroush Khanlou. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSSet (FunctionalMethods)

/**
 *  Returns a new set with only the objects that return `YES` to the `test` block. This function corresponds to `select` or `filter` in other programming languages.
 *
 *  @param test A block that returns a BOOL that determines whether a given object should be included in the result set. The block takes a parameter `object` and is called on each element in the set.
 *
 *  @return A new set with only the objects passing the test.
 */
- (NSSet*) setBySelectingObjectsPassingTest:(BOOL (^)(id object))test;

/**
 *  Returns a new set with the objects that return `YES` to the `test` block removed. This function corresponds to `reject` in other programming languages.
 *
 *  @param test A block that returns a BOOL that determines whether a given object should be removed from the result set. The block takes a parameter `object` and is called on each element in the set.
 *
 *  @return A new set with only the objects failing the test.
 */
- (NSSet*) setByRejectingObjectsPassingTest:(BOOL (^)(id object))test;


/**
 *  Returns a the first object that returns `YES` to the `test` block. This function corresponds to `match` in other programming languages.
 *
 *  @param test A block that returns a BOOL that determines whether a given object should be returned. The block takes a parameter `object` and is called on each element in the set.
 *
 *  @return The first object found in the set passing the test.
 */
- (id) firstObjectPassingTest:(BOOL (^)(id object))test;

/**
 *  Returns a new set with the objects that are returned by the block parameter. This function corresponds to `map` or `collect` in other programming languages.
 *
 *  @param block A block that returns a new object to be included in the new set. The block takes a parameter `object` and is called on each element in the set.
 *
 *  @return A new set with only the objects failing the test.
 */
- (NSSet*) setByTransformingObjectsUsingBlock:(id (^)(id object))block;

/**
 *  Returns an `accumulator` object after it has been called against every object in the set. This function corresponds to `reduce` or `inject` in other programming languages.
 *
 *  @param block A block that returns the `accumulator` after the `object` has been incorporated into the accumulator. The block takes a parameters `accumulator` and `object` and is called on each element in the set.
 *
 *  @return The accumulator after all objects have bene incorporated into it.
 */
- (id) objectByReducingObjectsIntoAccumulator:(id)accumulator usingBlock:(id (^)(id accumulator, id object))block;



/**
 *  Returns `YES` if all objects in the set return `YES` to the `test` block. This function corresponds to `all` in other programming languages. If any objects fail the test, the enumeration is short-circuited and ends early.
 *
 *  @param test A block that returns a BOOL that determines if the object passes the test. The block takes a parameter `object` and is called on each element in the set.
 *
 *  @return `YES` if all objects in the set pass the test, otherwise `NO`
 */
- (BOOL) allObjectsPassTest:(BOOL (^)(id object))test;

/**
 *  Returns `YES` if any of the objects in the set return `YES` to the `test` block. This function corresponds to `any` in other programming languages. If any objects passes the test, the enumeration is short-circuited and ends early.
 *
 *  @param test A block that returns a BOOL that determines if the object passes the test. The block takes a parameter `object` and is called on each element in the set.
 *
 *  @return `YES` if any one object in the set passes the test, otherwise `NO`
 */
- (BOOL) anyObjectsPassTest:(BOOL (^)(id object))test;

/**
 *  Returns `YES` if no objects in the set return `YES` to the `test` block. This function corresponds to `none` in other programming languages. If any object passes the test, the enumeration is short-circuited and ends early.
 *
 *  @param test A block that returns a BOOL that determines if the object passes the test. The block takes a parameter `object` and is called on each element in the set.
 *
 *  @return `YES` if no objects in the set pass the test, otherwise `NO`
 */
- (BOOL) noObjectsPassTest:(BOOL (^)(id object))test;

@end
