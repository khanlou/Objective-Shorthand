//
//  NSSet+FunctionalMethods.m
//  Objective-Shorthand
//
//  Created by Soroush Khanlou on 12/17/13.
//  Copyright (c) 2013 Soroush Khanlou. All rights reserved.
//

#import "NSSet+FunctionalMethods.h"

@implementation NSSet (FunctionalMethods)

- (NSSet*) setBySelectingObjectsPassingTest:(BOOL (^)(id object))test {
    return [self objectsPassingTest:^BOOL(id obj, BOOL *stop) {
        return test(obj);
    }];
}

- (NSSet*) setByRejectingObjectsPassingTest:(BOOL (^)(id object))test {
    return [self objectsPassingTest:^BOOL(id obj, BOOL *stop) {
        return !test(obj);
    }];
}

- (NSSet*) setByTransformingObjectsUsingBlock:(id (^)(id object))block {
    NSParameterAssert(block != nil);
    
    NSMutableSet *result = [NSMutableSet setWithCapacity:self.count];
    
    [self enumerateObjectsUsingBlock:^(id obj, BOOL *stop) {
        id value = block(obj);
        if (!value) value = [NSNull null];
        [result addObject:value];
    }];
    
    return result;
}

- (id) firstObjectPassingTest:(BOOL (^)(id object))test {
    NSParameterAssert(test != nil);
    
    __block id firstObjectPassingTest = nil;
    [self enumerateObjectsUsingBlock:^(id obj, BOOL *stop) {
        if (test(obj)) {
            firstObjectPassingTest = obj;
            *stop = YES;
        }
    }];
    
    return firstObjectPassingTest;
}

- (id) objectByReducingObjectsIntoAccumulator:(id)accumulator usingBlock:(id (^)(id accumulator, id object))block {
    NSParameterAssert(block != nil);
    
    __block id result = accumulator;
    
    [self enumerateObjectsUsingBlock:^(id obj, BOOL *stop) {
        result = block(result, obj);
    }];
    
    return result;
}

- (BOOL) allObjectsPassTest:(BOOL (^)(id object))test {
    NSParameterAssert(test != nil);
    
    NSSet *objectsPassingTest = [self objectsPassingTest:^BOOL(id obj, BOOL *stop) {
        BOOL passes = test(obj);
        if (!passes) {
            *stop = YES;
        }
        return passes;
    }];
    return objectsPassingTest.count == self.count;
}

- (BOOL) anyObjectsPassTest:(BOOL (^)(id object))test {
    NSParameterAssert(test != nil);
    
    NSSet *objectsPassingTest = [self objectsPassingTest:^BOOL(id obj, BOOL *stop) {
        BOOL passes = test(obj);
        if (passes) {
            *stop = YES;
        }
        return passes;
    }];
    return objectsPassingTest.count == 1;
}


- (BOOL) noObjectsPassTest:(BOOL (^)(id object))test {
    NSParameterAssert(test != nil);
    
    NSSet *objectsPassingTest = [self objectsPassingTest:^BOOL(id obj, BOOL *stop) {
        BOOL passes = test(obj);
        if (passes) {
            *stop = YES;
        }
        return passes;
    }];
    return objectsPassingTest.count == 0;
}

@end
