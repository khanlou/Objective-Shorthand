//
//  NSObject+JSON.h
//  Objective-Shorthand
//
//  Created by Soroush Khanlou on 12/10/13.
//  Copyright (c) 2013 Soroush Khanlou. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (JSON)

- (id) objectFromJSONString;

@end


@interface NSArray (JSON)

- (NSString *)JSONString;

@end


@interface NSDictionary (JSON)

- (NSString *)JSONString;

@end
