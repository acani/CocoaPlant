#import <Foundation/Foundation.h>

@interface NSString (CocoaPlant)

- (NSString *)stringByTrimmingWhitespaceAndNewlineCharacters;
- (NSString *)stringByTrimmingLeadingCharactersInSet:(NSCharacterSet *)characterSet;
- (NSString *)stringByTrimmingLeadingWhitespaceAndNewlineCharacters;
- (NSString *)stringByTrimmingTrailingCharactersInSet:(NSCharacterSet *)characterSet;
- (NSString *)stringByTrimmingTrailingWhitespaceAndNewlineCharacters;

- (NSMutableArray *)words;
-(BOOL) isValidEmail;

@end
