#import "NSString+CocoaPlant.h"

static NSMutableCharacterSet *wordSeparatorsCharacterSet;

@implementation NSString (CocoaPlant)

+ (void)load {
    wordSeparatorsCharacterSet = [NSMutableCharacterSet whitespaceAndNewlineCharacterSet];
    [wordSeparatorsCharacterSet formUnionWithCharacterSet:[NSCharacterSet punctuationCharacterSet]];
}

#pragma mark - Trimming Methods

- (NSString *)stringByTrimmingWhitespaceAndNewlineCharacters {
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

- (NSString *)stringByTrimmingLeadingCharactersInSet:(NSCharacterSet *)characterSet {
    NSRange rangeOfFirstWantedCharacter = [self rangeOfCharacterFromSet:[characterSet invertedSet]];
    if (rangeOfFirstWantedCharacter.location == NSNotFound) {
        return @"";
    }
    return [self substringFromIndex:rangeOfFirstWantedCharacter.location];
}

- (NSString *)stringByTrimmingLeadingWhitespaceAndNewlineCharacters {
    return [self stringByTrimmingLeadingCharactersInSet:
            [NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

- (NSString *)stringByTrimmingTrailingCharactersInSet:(NSCharacterSet *)characterSet {
    NSRange rangeOfLastWantedCharacter = [self rangeOfCharacterFromSet:[characterSet invertedSet]
                                                               options:NSBackwardsSearch];
    if (rangeOfLastWantedCharacter.location == NSNotFound) {
        return @"";
    }
    return [self substringToIndex:rangeOfLastWantedCharacter.location+1]; // non-inclusive
}

- (NSString *)stringByTrimmingTrailingWhitespaceAndNewlineCharacters {
    return [self stringByTrimmingTrailingCharactersInSet:
            [NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

#pragma mark - Separator Methods

- (NSMutableArray *)words {
    NSScanner *scanner = [NSScanner scannerWithString:self];
    NSString *string;
    NSMutableArray *words = [NSMutableArray array];
    while ([scanner scanUpToCharactersFromSet:wordSeparatorsCharacterSet intoString:&string]) {
        [words addObject:string];
    }
    return words;
//    // The following implementation doesn't ignore leading, trailing, or consecutive whitespaces.
//    // Also, it's perhaps slightly slower than the solution above.
//    // See Xcode Documentation on -[NSString componentsSeparatedByCharactersInSet:] for more info.
//    NSCharacterSet *separators = [NSCharacterSet whitespaceAndNewlineCharacterSet];
//    return [self componentsSeparatedByCharactersInSet:separators];
}

@end
