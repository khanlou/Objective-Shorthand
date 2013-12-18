//
//  NSObject+ComparisonMethods.h
//  Objective-Shorthand
//
//  Created by Soroush Khanlou on 12/10/13.
//  Copyright (c) 2013 Soroush Khanlou. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (ComparisonMethods)

/**
 *  Returns whether the reciever is equal to the object passed in.
 *
 *  This method uses `compare:` to determine equality, not `isEquals:`.
 *
 *  @param object The object to compare to.
 *
 *  @return `YES` if the receiver is equal to the first parameter, otherwise `NO`.
 */
- (BOOL)isEqualTo:(id)object;

/**
 *  Returns whether the reciever is less than or equal to the object passed in.
 *
 *  @param object The object to compare to.
 *
 *  @return `YES` if the receiver is less than or equal to the first parameter, otherwise `NO`.
 */
- (BOOL)isLessThanOrEqualTo:(id)object;

/**
 *  Returns whether the reciever is less than the object passed in.
 *
 *  @param object The object to compare to.
 *
 *  @return `YES` if the receiver is less than the first parameter, otherwise `NO`.
 */
- (BOOL)isLessThan:(id)object;

/**
 *  Returns whether the reciever is greater than or equal to the object passed in.
 *
 *  @param object The object to compare to.
 *
 *  @return `YES` if the receiver is greater than or equal to the first parameter, otherwise `NO`.
 */
- (BOOL)isGreaterThanOrEqualTo:(id)object;

/**
 *  Returns whether the reciever is greater than the object passed in, otherwise `NO`.
 *
 *  @param object The object to compare to.
 *
 *  @return `YES` if the receiver is equal to the first parameter.
 */
- (BOOL)isGreaterThan:(id)object;

/**
 *  Returns whether the reciever is not equal to the object passed in.
 *
 *  @param object The object to compare to.
 *
 *  @return `YES` if the receiver is not equal to the first parameter, otherwise `NO`.
 */
- (BOOL)isNotEqualTo:(id)object;

@end
