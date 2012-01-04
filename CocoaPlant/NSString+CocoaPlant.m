#import "NSString+CocoaPlant.h"

@implementation NSString (CocoaPlant)

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
    NSCharacterSet *whiteSpace = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    NSString *string;
    NSMutableArray *words = [NSMutableArray array];
    while ([scanner scanUpToCharactersFromSet:whiteSpace intoString:&string]) {
        [words addObject:string];
    }
    return words;
//    // The following implementation doesn't ignore leading, trailing, or consecutive whitespaces.
//    // Also, it's perhaps slightly slower than the solution above.
//    // See Xcode Documentation on -[NSString componentsSeparatedByCharactersInSet:] for more info.
//    NSCharacterSet *separators = [NSCharacterSet whitespaceAndNewlineCharacterSet];
//    return [self componentsSeparatedByCharactersInSet:separators];
}

#pragma mark - Is Email Method

-(BOOL) isValidEmail {
    BOOL stricterFilter = YES; // Discussion http://blog.logichigh.com/2010/09/02/validating-an-e-mail-address/
    NSString *stricterFilterString = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSString *laxString = @".+@.+\\.[A-Za-z]{2}[A-Za-z]*";
    NSString *emailRegex = stricterFilter ? stricterFilterString : laxString;
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:self];
}

@end
