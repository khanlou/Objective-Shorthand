//
//  NSString+DataConversion.h
//  Objective-Shorthand
//
//  Created by Soroush Khanlou on 2/20/14.
//  Copyright (c) 2014 Soroush Khanlou. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (DataConversion)

- (NSData*)dataRepresentation;

@end

@interface NSData (StringConversion)

- (NSString*)stringRepresentation;

@end
