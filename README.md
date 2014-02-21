# Objective-Shorthand

Objective-Shorthand is a set of categories on Foundation objects that make long things in Objective-C short. Additions are encouraged.

Use Cocoapods to get Objective-Shorthand:

	pod 'Objective-Shorthand', '~> 1.0'

## What can Objective-Shorthand help with?

### Regular Expressions

Objective-Shorthand shortens the code for seeing if a regular expression matches a string from:

    NSRegularExpression *regularExpression = [NSRegularExpression regularExpressionWithPattern:regex options:0 error:nil];
    NSUInteger numberOfMatches = [regularExpression numberOfMatchesInString:self options:0 range:NSMakeRange(0, self.length)];
	BOOL doesMatch = numberOfMatches > 0;

to:

    BOOL doesMatch = [string matchesRegex:regex];

A method to find the range of the first match for a given regex is also included:

	- (NSRange) rangeOfFirstSubstringMatching:(NSString*)regex;

### JSON

Using `NSJSONSerialization`, you have convert your strings to `NSData` before deserializing them to arrays and dictionaries. Objective-Shorthand simplifies all that.

It provides the same interface as `JSONKit`, but it works with the built-in Apple JSON serializer behind the scenes. The Ruby community is very good at writing libraries with consistent interfaces, and this is something we need to steal as writers of Objective-C. 

To convert from a JSON string to an `NSArray` or `NSDictionary`:

	- (id) objectFromJSONString;

And to convert from an array or dictionary to an `NSString`:

	- (NSString *)JSONString;

### NSComparisonMethods

The OS X SDK has a weird API called [NSComparisonMethods](https://developer.apple.com/library/mac/documentation/cocoa/reference/foundation/Protocols/NSComparisonMethods_Protocol/Reference/Reference.html). Basically, this API provides a wrapper around `compare:` and uses it define the following methods:

	- (BOOL)isEqualTo:(id)object;
	- (BOOL)isLessThanOrEqualTo:(id)object;
	- (BOOL)isLessThan:(id)object;
	- (BOOL)isGreaterThanOrEqualTo:(id)object;
	- (BOOL)isGreaterThan:(id)object;
	- (BOOL)isNotEqualTo:(id)object;

For some reason, this never made it over to iOS, even though it's tremendously useful. I like these methods because they're way more semantic than the regular `compare:` method. `[object isGreaterThan:otherObject]` is way easier to understand than `[object compare:otherObject] == NSOrderedDescending`.

If the object in question doesn't respond to `compare:`, an exception will be thrown.

### Data Detection Convenience Methods

`NSDataDetector` can be a handful sometimes. Objective-Shorthand simplifies complex `NSDataDetector` objects to one line of code on NSString:

	- (BOOL) isEmail;
	- (BOOL) isURL;
	- (BOOL) isPhoneNumber;
	- (BOOL) isDate;
	- (BOOL) isAddress;

### NSArray Convenience Methods

Pulling out the unique elements of an array involves the ever-goofy `[array valueForKeyPath:@"@distinctUnionOfObjects.self"]`. This is wrapped up inside of the following method:

	- (NSArray*) uniquedArray;

You never have to remember how to type that string literal again! Autocomplete Rules Everything Around Me.

There's also `-sortedArray` which uses the default `compare:` selector to compare objects:

	- (NSArray*) sortedArray;

Objective-Shorthand also includes `-reversedArray` and `-flattenedArray`.

### Functional Collection Operators

Finally, Objective-Shorthand provides a category on `NSArray` that provides the normal functional collection operators, like `map`, `select`, and `any`, but with names that are both more semantic and more native to Objective-C.

`each` is already defined in Foundation, so it is not included.

	- (void)enumerateObjectsUsingBlock:(void (^)(id obj, NSUInteger idx, BOOL *stop))block;

The other operators can be found, including `select` (aka `filter`) and `reject`:

	- (NSArray*) arrayBySelectingObjectsPassingTest:(BOOL (^)(id object))test;
	- (NSArray*) arrayByRejectingObjectsPassingTest:(BOOL (^)(id object))test;

`map` (aka `collect`) and `reduce` (aka `inject`) are available as well.

	- (NSArray*) arrayByTransformingObjectsUsingBlock:(id (^)(id object))block;
	- (id) objectByReducingObjectsIntoAccumulator:(id)accumulator usingBlock:(id (^)(id accumulator, id object))block;

`sample` and `match` are available.

	- (id) firstObjectPassingTest:(BOOL (^)(id object))test;
	- (id) randomObject;

And finally, some boolean operators:

	- (BOOL) allObjectsPassTest:(BOOL (^)(id object))test;
	- (BOOL) anyObjectsPassTest:(BOOL (^)(id object))test;
	- (BOOL) noObjectsPassTest:(BOOL (^)(id object))test;

All of the above methods are also included for `NSSet` and `NSDictionary`.

## String Methods

Thanks to @bgottlob, Objective-Shorthand has some string functions as well.

    - (BOOL)contains:(NSString *)testString
    - (BOOL)isEqualToStringIgnoringCase:(NSString *)otherString
    - (NSString *)stringByRemovingOccurrencesOfString:(NSString *)removeString
    
## Data Conversion

Every single time I need to convert `NSString`s to `NSData`, I have to check Stack Overflow. Never again!

`NSString` now has `-dataRepresentation`, and `NSData` now has `-stringRepresentation`.

## Additions

Pull requests are welcome, however, there is a test suite and AppleDoc-compliant documentation for each method. Please make sure that you are not breaking the tests, and if you add new methods, make sure there is test coverage for it and relevant documention is included.

If you have questions, comments, or suggestions, please get in touch. You can find me on Twitter at [@khanlou](http://twitter.com/khanlou) and email at <soroush@khanlou.com>.
