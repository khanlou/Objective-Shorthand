//
//  NSArray+Convenience.m
//  Objective-Shorthand
//
//  Created by Soroush Khanlou on 12/10/13.
//  Copyright (c) 2013 Soroush Khanlou. All rights reserved.
//

#import "NSArray+Convenience.h"

@implementation NSArray (Convenience)

- (NSArray*)flattenedArray {
    NSMutableArray *array = [NSMutableArray array];
    
    for (id object in self) {
        if ([object isKindOfClass:NSArray.class]) {
            [array addObjectsFromArray:[object flattenedArray]];
        } else {
            [array addObject:object];
        }
    }
    
    return array;
}

- (NSArray*)uniquedArray {
    return [[NSOrderedSet orderedSetWithArray:self] array];
}

- (NSArray*)sortedArray {
    return [self sortedArrayUsingSelector:@selector(compare:)];
}

- (NSArray*)reversedArray {
    return [[self reverseObjectEnumerator] allObjects];
}

@end
