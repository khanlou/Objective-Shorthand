//
//  NSObject+ComparisonMethods.m
//  Objective-Shorthand
//
//  Created by Soroush Khanlou on 12/10/13.
//  Copyright (c) 2013 Soroush Khanlou. All rights reserved.
//

#import "NSObject+ComparisonMethods.h"

@implementation NSObject (ComparisonMethods)

- (BOOL)isEqualTo:(id)object {
    SEL comparisonSelector = @selector(compare:);
    NSAssert([self respondsToSelector:comparisonSelector], @"To use the comparison methods, this object must respond to the selector `compare:`");
    
    NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:[[self class] instanceMethodSignatureForSelector:comparisonSelector]];
    invocation.selector = comparisonSelector;
    invocation.target = self;
    [invocation setArgument:&object atIndex:2];
    [invocation invoke];
    NSComparisonResult comparisonResult;
    [invocation getReturnValue:&comparisonResult];
    
    return comparisonResult == NSOrderedSame ;
}

- (BOOL)isLessThanOrEqualTo:(id)object {
    SEL comparisonSelector = @selector(compare:);
    NSAssert([self respondsToSelector:comparisonSelector], @"To use the comparison methods, this object must respond to the selector `compare:`");
    
    NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:[[self class] instanceMethodSignatureForSelector:comparisonSelector]];
    invocation.selector = comparisonSelector;
    invocation.target = self;
    [invocation setArgument:&object atIndex:2];
    [invocation invoke];
    NSComparisonResult comparisonResult;
    [invocation getReturnValue:&comparisonResult];

    return comparisonResult == NSOrderedSame || comparisonResult == NSOrderedAscending;
}

- (BOOL)isLessThan:(id)object {
    SEL comparisonSelector = @selector(compare:);
    NSAssert([self respondsToSelector:comparisonSelector], @"To use the comparison methods, this object must respond to the selector `compare:`");
    
    NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:[[self class] instanceMethodSignatureForSelector:comparisonSelector]];
    invocation.selector = comparisonSelector;
    invocation.target = self;
    [invocation setArgument:&object atIndex:2];
    [invocation invoke];
    NSComparisonResult comparisonResult;
    [invocation getReturnValue:&comparisonResult];
    
    return comparisonResult == NSOrderedAscending;
}

- (BOOL)isGreaterThanOrEqualTo:(id)object {
    SEL comparisonSelector = @selector(compare:);
    NSAssert([self respondsToSelector:comparisonSelector], @"To use the comparison methods, this object must respond to the selector `compare:`");
    
    NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:[[self class] instanceMethodSignatureForSelector:comparisonSelector]];
    invocation.selector = comparisonSelector;
    invocation.target = self;
    [invocation setArgument:&object atIndex:2];
    [invocation invoke];
    NSComparisonResult comparisonResult;
    [invocation getReturnValue:&comparisonResult];
    
    return comparisonResult == NSOrderedSame || comparisonResult == NSOrderedDescending;
}

- (BOOL)isGreaterThan:(id)object {
    SEL comparisonSelector = @selector(compare:);
    NSAssert([self respondsToSelector:comparisonSelector], @"To use the comparison methods, this object must respond to the selector `compare:`");
    
    NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:[[self class] instanceMethodSignatureForSelector:comparisonSelector]];
    invocation.selector = comparisonSelector;
    invocation.target = self;
    [invocation setArgument:&object atIndex:2];
    [invocation invoke];
    NSComparisonResult comparisonResult;
    [invocation getReturnValue:&comparisonResult];
    
    return comparisonResult == NSOrderedDescending;
}

- (BOOL)isNotEqualTo:(id)object {
    SEL comparisonSelector = @selector(compare:);
    NSAssert([self respondsToSelector:comparisonSelector], @"To use the comparison methods, this object must respond to the selector `compare:`");
    
    NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:[[self class] instanceMethodSignatureForSelector:comparisonSelector]];
    invocation.selector = comparisonSelector;
    invocation.target = self;
    [invocation setArgument:&object atIndex:2];
    [invocation invoke];
    NSComparisonResult comparisonResult;
    [invocation getReturnValue:&comparisonResult];
    
    return comparisonResult != NSOrderedSame;
}

@end
