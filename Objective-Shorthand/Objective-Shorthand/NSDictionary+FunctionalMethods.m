//
//  NSDictionary+FunctionalMethods.m
//  Objective-Shorthand
//
//  Created by Soroush Khanlou on 12/17/13.
//  Copyright (c) 2013 Soroush Khanlou. All rights reserved.
//

#import "NSDictionary+FunctionalMethods.h"
#import "NSArray+FunctionalMethods.h"

@implementation NSDictionary (FunctionalMethods)

- (NSDictionary*) dictionaryBySelectingKeysAndValuesPassingTest:(BOOL (^)(id key, id value))test {
    NSParameterAssert(test != nil);
    
    NSSet *keysPassingTest = [self keysOfEntriesPassingTest:^BOOL(id key, id value, BOOL *stop) {
        return test(key, value);
    }];
    return [self dictionaryWithValuesForKeys:[keysPassingTest allObjects]];
}

- (NSDictionary*) dictionaryByRejectingKeysAndValuesPassingTest:(BOOL (^)(id key, id value))test {
    return [self dictionaryBySelectingKeysAndValuesPassingTest:^BOOL(id key, id value) {
        return !test(key, value);
    }];
}

- (NSDictionary*) dictionaryByTransformingValuesUsingBlock:(id (^)(id key, id value))block {
    NSParameterAssert(block != nil);
    
    NSMutableDictionary *result = [NSMutableDictionary dictionaryWithCapacity:self.count];
    
    [self enumerateKeysAndObjectsUsingBlock:^(id key, id value, BOOL *stop) {
        id newValue = block(key, value);
        if (!newValue) newValue = [NSNull null];
        result[key] = newValue;
    }];
    
    return result;
}

- (id) keyForFirstValuePassingTest:(BOOL (^)(id key, id value))test {
    NSParameterAssert(test != nil);
    
    __block id firstKeyPassingTest = nil;
    [self enumerateKeysAndObjectsUsingBlock:^(id key, id value, BOOL *stop) {
        if (test(key, value)) {
            firstKeyPassingTest = key;
            *stop = YES;
        }
    }];
    
    return firstKeyPassingTest;
}

- (id) randomKey {
    if (self.count == 0) {
        return nil;
    }
    return self.allKeys.randomObject;
}

- (id) objectByReducingKeysAndValuesIntoAccumulator:(id)accumulator usingBlock:(id (^)(id accumulator, id key, id value))block {
    NSParameterAssert(block != nil);
    
    __block id result = accumulator;
    
    [self enumerateKeysAndObjectsUsingBlock:^(id key, id value, BOOL *stop) {
        result = block(result, key, value);
    }];
    
    return result;
}

- (BOOL) allKeyValuePairsPassTest:(BOOL (^)(id key, id value))test {
    NSParameterAssert(test != nil);
    
    NSSet *keysOfEntriesPassingTest = [self keysOfEntriesPassingTest:^BOOL(id key, id value, BOOL *stop) {
        BOOL passes = test(key, value);
        if (!passes) {
            *stop = YES;
        }
        return passes;
    }];
    return keysOfEntriesPassingTest.count == self.count;
}

- (BOOL) anyKeyValuePairsPassTest:(BOOL (^)(id key, id value))test {
    NSParameterAssert(test != nil);
    
    NSSet *keysOfEntriesPassingTest = [self keysOfEntriesPassingTest:^BOOL(id key, id value, BOOL *stop) {
        BOOL passes = test(key, value);
        if (passes) {
            *stop = YES;
        }
        return passes;
    }];
    return keysOfEntriesPassingTest.count == 1;
}


- (BOOL) noKeyValuePairsPassTest:(BOOL (^)(id key, id value))test {
    NSParameterAssert(test != nil);
    
    NSSet *keysOfEntriesPassingTest = [self keysOfEntriesPassingTest:^BOOL(id key, id value, BOOL *stop) {
        BOOL passes = test(key, value);
        if (passes) {
            *stop = YES;
        }
        return passes;
    }];
    return keysOfEntriesPassingTest.count == 0;
}

@end
