//
//  NSArray+FunctionalMethods.m
//  Objective-Shorthand
//
//  Created by Soroush Khanlou on 12/10/13.
//  Copyright (c) 2013 Soroush Khanlou. All rights reserved.
//

#import "NSArray+FunctionalMethods.h"

@implementation NSArray (FunctionalMethods)

- (NSArray*) arrayBySelectingObjectsPassingTest:(BOOL (^)(id object))test {
    NSParameterAssert(test != nil);
    
    NSIndexSet *indexesOfSelectedObjects = [self indexesOfObjectsPassingTest:^BOOL(id obj, NSUInteger idx, BOOL *stop) {
        return test(obj);
    }];
    return [self objectsAtIndexes:indexesOfSelectedObjects];
}

- (NSArray*) arrayByRejectingObjectsPassingTest:(BOOL (^)(id))test {
    return [self arrayBySelectingObjectsPassingTest:^BOOL(id object) {
        return !test(object);
    }];
}

- (NSArray*) arrayByTransformingObjectsUsingBlock:(id (^)(id object))block {
    NSParameterAssert(block != nil);
    
    NSMutableArray *result = [NSMutableArray arrayWithCapacity:self.count];
    
    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        id value = block(obj);
        if (!value) value = [NSNull null];
        [result addObject:value];
    }];
    
    return result;
}

- (id) firstObjectPassingTest:(BOOL (^)(id object))test {
    NSParameterAssert(test != nil);
    
    __block id firstObjectPassingTest = nil;
    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        if (test(obj)) {
            firstObjectPassingTest = obj;
            *stop = YES;
        }
    }];
    
    return firstObjectPassingTest;
}

- (id) randomObject {
    if (self.count == 0) {
        return nil;
    }
    NSUInteger randomIndex = arc4random_uniform(self.count);
    return self[randomIndex];
}

- (id) objectByReducingObjectsIntoAccumulator:(id)accumulator usingBlock:(id (^)(id accumulator, id object))block {
    NSParameterAssert(block != nil);
    
    __block id result = accumulator;
    
    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        result = block(result, obj);
    }];
    
    return result;
}

- (BOOL) allObjectsPassTest:(BOOL (^)(id object))test {
    NSParameterAssert(test != nil);
    
    NSIndexSet *indexesOfObjectsPassingTest = [self indexesOfObjectsPassingTest:^BOOL(id obj, NSUInteger idx, BOOL *stop) {
        BOOL passes = test(obj);
        if (!passes) {
            *stop = YES;
        }
        return passes;
    }];
    return indexesOfObjectsPassingTest.count == self.count;
}

- (BOOL) anyObjectsPassTest:(BOOL (^)(id object))test {
    NSParameterAssert(test != nil);
    
    NSIndexSet *indexesOfObjectsPassingTest = [self indexesOfObjectsPassingTest:^BOOL(id obj, NSUInteger idx, BOOL *stop) {
        BOOL passes = test(obj);
        if (passes) {
            *stop = YES;
        }
        return passes;
    }];
    return indexesOfObjectsPassingTest.count == 1;
}


- (BOOL) noObjectsPassTest:(BOOL (^)(id object))test {
    NSParameterAssert(test != nil);
    
    NSIndexSet *indexesOfObjectsPassingTest = [self indexesOfObjectsPassingTest:^BOOL(id obj, NSUInteger idx, BOOL *stop) {
        BOOL passes = test(obj);
        if (passes) {
            *stop = YES;
        }
        return passes;
    }];
    return indexesOfObjectsPassingTest.count == 0;
}

@end
