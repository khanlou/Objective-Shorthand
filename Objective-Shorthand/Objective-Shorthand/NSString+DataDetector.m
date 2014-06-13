//
//  NSString+DataDetector.m
//  Objective-Shorthand
//
//  Created by Soroush Khanlou on 12/17/13.
//  Copyright (c) 2013 Soroush Khanlou. All rights reserved.
//

#import "NSString+DataDetector.h"

@implementation NSString (DataDetector)

- (BOOL) isEmail {
    NSDataDetector * dataDetector = [NSDataDetector dataDetectorWithTypes:NSTextCheckingTypeLink error:nil];
    NSTextCheckingResult * firstMatch = [dataDetector firstMatchInString:self options:0 range:NSMakeRange(0, self.length)];
    return (firstMatch
            && firstMatch.range.location == 0
            && firstMatch.range.length == self.length
            && [firstMatch.URL.scheme isEqualToString:@"mailto"]);
}

- (BOOL) isURL {
    NSDataDetector *dataDetector = [NSDataDetector dataDetectorWithTypes:NSTextCheckingTypeLink error:nil];
    NSTextCheckingResult *firstMatch = [dataDetector firstMatchInString:self options:0 range:NSMakeRange(0, self.length)];
    return (firstMatch
            && firstMatch.range.location == 0
            && firstMatch.range.length == self.length
            && ![firstMatch.URL.scheme isEqualToString:@"mailto"]);
}

- (BOOL) isPhoneNumber {
    NSDataDetector *dataDetector = [NSDataDetector dataDetectorWithTypes:NSTextCheckingTypePhoneNumber error:nil];
    NSTextCheckingResult *firstMatch = [dataDetector firstMatchInString:self options:0 range:NSMakeRange(0, self.length)];
    return firstMatch.range.location == 0 && firstMatch.range.length == self.length;
}

- (BOOL) isDate {
    NSDataDetector *dataDetector = [NSDataDetector dataDetectorWithTypes:NSTextCheckingTypeDate error:nil];
    NSTextCheckingResult *firstMatch = [dataDetector firstMatchInString:self options:0 range:NSMakeRange(0, self.length)];
    return firstMatch.range.location == 0 && firstMatch.range.length == self.length;
}

- (BOOL) isAddress {
    NSDataDetector *dataDetector = [NSDataDetector dataDetectorWithTypes:NSTextCheckingTypeAddress error:nil];
    NSTextCheckingResult *firstMatch = [dataDetector firstMatchInString:self options:0 range:NSMakeRange(0, self.length)];
    return firstMatch.range.location == 0 && firstMatch.range.length == self.length;
}

@end
