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
- (NSArray*) arrayByUniquingObjects;

@end