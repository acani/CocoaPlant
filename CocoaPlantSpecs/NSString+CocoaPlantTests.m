#import <SenTestingKit/SenTestingKit.h>

#import "NSString+CocoaPlant.h"

@interface NSString_CocoaPlantTests : SenTestCase
@end

@implementation NSString_CocoaPlantTests

#pragma mark - Trimming Tests

- (void)testStringByTrimmingLeadingCharactersInSet {
    NSCharacterSet *letterCharSet = [NSCharacterSet letterCharacterSet];
    STAssertEqualObjects([@"zip90210zip" stringByTrimmingLeadingCharactersInSet:letterCharSet],
                         @"90210zip", nil);
}

- (void)testStringByTrimmingLeadingWhitespaceAndNewlineCharacters {
    STAssertEqualObjects([@"" stringByTrimmingLeadingWhitespaceAndNewlineCharacters], @"", nil);
    STAssertEqualObjects([@"\n " stringByTrimmingLeadingWhitespaceAndNewlineCharacters], @"", nil);
    STAssertEqualObjects([@"\n hello \n" stringByTrimmingLeadingWhitespaceAndNewlineCharacters],
                         @"hello \n", nil);
}

- (void)testStringByTrimmingTrailingCharactersInSet {
    NSCharacterSet *letterCharSet = [NSCharacterSet letterCharacterSet];
    STAssertEqualObjects([@"zip90210zip" stringByTrimmingTrailingCharactersInSet:letterCharSet],
                         @"zip90210", nil);
}

- (void)testStringByTrimmingTrailingWhitespaceAndNewlineCharacters {
    STAssertEqualObjects([@"" stringByTrimmingLeadingWhitespaceAndNewlineCharacters], @"", nil);
    STAssertEqualObjects([@"\n " stringByTrimmingLeadingWhitespaceAndNewlineCharacters], @"", nil);
    STAssertEqualObjects([@"\n hello \n" stringByTrimmingTrailingWhitespaceAndNewlineCharacters],
                         @"\n hello", nil);
}

#pragma mark - Separator Tests

- (void)testWords {
    NSMutableArray *words = [NSMutableArray arrayWithObjects:@"hey", nil];
    STAssertEqualObjects([@"hey" words], words, nil);
    STAssertEqualObjects([@"\n hey \n " words], words, nil);

    [words addObject:@"yo"];
    STAssertEqualObjects([@"hey yo" words], words, nil);
    STAssertEqualObjects([@" \n hey   yo \n" words], words, nil);

    [words addObject:@"man"];
    STAssertEqualObjects([@"hey yo man" words], words, nil);
    STAssertEqualObjects([@" \n hey   yo\n man \n" words], words, nil);
}

@end
