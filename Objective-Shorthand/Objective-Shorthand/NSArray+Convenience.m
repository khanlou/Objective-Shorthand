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
    return [self valueForKeyPath:@"@distinctUnionOfObjects.self"];
}

- (NSArray*)sortedArray {
    return [self sortedArrayUsingSelector:@selector(compare:)];
}

- (NSArray*)reversedArray {
    NSMutableArray *reversedArray = [NSMutableArray arrayWithCapacity:[self count]];
    NSEnumerator *enumerator = [self reverseObjectEnumerator];
    for (id element in enumerator) {
        [reversedArray addObject:element];
    }
    return reversedArray;
}

@end
