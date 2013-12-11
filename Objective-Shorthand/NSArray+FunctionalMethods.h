//
//  NSArray+FunctionalMethods.h
//  Objective-Shorthand
//
//  Created by Soroush Khanlou on 12/10/13.
//  Copyright (c) 2013 Soroush Khanlou. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (FunctionalMethods)

- (NSArray*) arrayBySelectingItemsPassingTest:(BOOL (^)(id object))test;
- (NSArray*) arrayByRejectingItemsPassingTest:(BOOL (^)(id object))test;

- (NSArray*) arrayByTransformingObjectsUsingBlock:(id (^)(id object))block;
- (id) objectByReducingObjectsIntoAccumulator:(id)accumulator usingBlock:(id (^)(id accumulator, id object))block;

- (BOOL) allObjectsPassTest:(BOOL (^)(id object))test;
- (BOOL) anyObjectsPassTest:(BOOL (^)(id object))test;
- (BOOL) noObjectsPassTest:(BOOL (^)(id object))test;

@end
