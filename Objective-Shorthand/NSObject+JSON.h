//
//  NSObject+JSON.h
//  Objective-Shorthand
//
//  Created by Soroush Khanlou on 12/10/13.
//  Copyright (c) 2013 Soroush Khanlou. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (JSON)

/**
 *  Creates an object from a JSON string, and returns it.
 *
 *  @return An NSArray or an NSDictionary built form the JSON string.
 */
- (id) objectFromJSONString;

@end


@interface NSArray (JSON)

/**
 *  Creates a string of the JSON representation of the array.
 *
 *  @return An NSString containing the JSON representation of the array.
 */
- (NSString *)JSONString;

@end


@interface NSDictionary (JSON)

/**
 *  Creates a string of the JSON representation of the dictionary.
 *
 *  @return An NSString containing the JSON representation of the dictionary.
 */

- (NSString *)JSONString;

@end
