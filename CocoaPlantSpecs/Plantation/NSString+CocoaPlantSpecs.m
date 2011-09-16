#import <Kiwi/Kiwi.h>

#import "NSString+CocoaPlant.h"

SPEC_BEGIN(NSString_CocoaPlantSpecs)

describe(@"NSString+CocoaPlant", ^{
    it(@"-stringByTrimmingLeadingCharactersInSet", ^{
        NSCharacterSet *letterCharSet = [NSCharacterSet letterCharacterSet];
        [[[@"zip90210zip" stringByTrimmingLeadingCharactersInSet:letterCharSet] should]
         equal:@"90210zip"];
    });

    it(@"-stringByTrimmingLeadingWhitespaceAndNewlineCharacters", ^{
        [[[@"" stringByTrimmingLeadingWhitespaceAndNewlineCharacters] should] beEmpty];
        [[[@"\n " stringByTrimmingLeadingWhitespaceAndNewlineCharacters] should] beEmpty];
        [[[@"\n hello \n" stringByTrimmingLeadingWhitespaceAndNewlineCharacters] should]
         equal:@"hello \n"];
    });
    
    it(@"-stringByTrimmingTrailingCharactersInSet", ^{
        NSCharacterSet *letterCharSet = [NSCharacterSet letterCharacterSet];
        [[[@"zip90210zip" stringByTrimmingTrailingCharactersInSet:letterCharSet] should]
         equal:@"zip90210"];
    });
        
    it(@"-stringByTrimmingTrailingWhitespaceAndNewlineCharacters", ^{
        [[[@"" stringByTrimmingTrailingWhitespaceAndNewlineCharacters] should] beEmpty];
        [[[@"\n " stringByTrimmingTrailingWhitespaceAndNewlineCharacters] should] beEmpty];
        [[[@"\n hello \n" stringByTrimmingTrailingWhitespaceAndNewlineCharacters] should]
         equal:@"\n hello"];
    });
});

SPEC_END
