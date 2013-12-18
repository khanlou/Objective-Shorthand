//
//  NSString+DataDetector.h
//  Objective-Shorthand
//
//  Created by Soroush Khanlou on 12/17/13.
//  Copyright (c) 2013 Soroush Khanlou. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (DataDetector)

/**
 *  Returns whether or not the given string is an email address using NSDataDetector APIs.
 * 
 * The full string must be an email address. This method does not trim the string before checking.
 *
 *  @return `YES` if the string is an email, `NO` if it is not.
 */
- (BOOL) isEmail;

/**
 *  Returns whether or not the given string is a valid URL using NSDataDetector APIs.
 *
 * The full string must be a URL. This method does not trim the string before checking.
 *
 *  @return `YES` if the string is a URL, `NO` if it is not.
 */
- (BOOL) isURL;

/**
 *  Returns whether or not the given string is an phone number using NSDataDetector APIs.
 *
 * The full string must be a phone number. This method does not trim the string before checking.
 *
 *  @return `YES` if the string is an phone number, `NO` if it is not.
 */
- (BOOL) isPhoneNumber;

/**
 *  Returns whether or not the given string is a date using NSDataDetector APIs.
 *
 * The full string must be date. This method does not trim the string before checking.
 *
 *  @return `YES` if the string is an date, `NO` if it is not.
 */
- (BOOL) isDate;

/**
 *  Returns whether or not the given string is an address using NSDataDetector APIs.
 *
 * The full string must be an address. This method does not trim the string before checking.
 *
 *  @return `YES` if the string is an address, `NO` if it is not.
 */
- (BOOL) isAddress;

@end
