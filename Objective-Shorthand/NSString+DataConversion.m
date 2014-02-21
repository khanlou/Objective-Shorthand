//
//  NSString+DataConversion.m
//  Objective-Shorthand
//
//  Created by Soroush Khanlou on 2/20/14.
//  Copyright (c) 2014 Soroush Khanlou. All rights reserved.
//

#import "NSString+DataConversion.h"

@implementation NSString (DataConversion)

- (NSData*)dataRepresentation {
    return [self dataUsingEncoding:NSUTF8StringEncoding];
}

@end

@implementation NSData (StringConversion)

- (NSString*)stringRepresentation {
    return [[NSString alloc] initWithData:self encoding:NSUTF8StringEncoding];
}

@end