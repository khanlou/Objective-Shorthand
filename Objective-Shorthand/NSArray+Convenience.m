//
//  NSArray+Convenience.m
//  Objective-Shorthand
//
//  Created by Soroush Khanlou on 12/10/13.
//  Copyright (c) 2013 Soroush Khanlou. All rights reserved.
//

#import "NSArray+Convenience.h"

@implementation NSArray (Convenience)

- (NSArray*) arrayByUniquingObjects {
    return [self valueForKeyPath:@"@distinctUnionOfObjects.self"];
}

@end
