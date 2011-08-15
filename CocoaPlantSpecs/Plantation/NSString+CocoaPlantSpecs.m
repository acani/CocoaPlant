#import <Kiwi/Kiwi.h>

#import "NSString+CocoaPlant.h"

SPEC_BEGIN(NSString_CocoaPlantSpecs)

describe(@"NSString+CocoaPlant", ^{
    specify(@"-stringByTrimmingLeadingCharactersInSet", ^{
        NSCharacterSet *letterCharSet = [NSCharacterSet letterCharacterSet];
        [[[@"zip90210zip" stringByTrimmingLeadingCharactersInSet:letterCharSet] should]
         equal:@"90210zip"];
    });

    specify(@"-stringByTrimmingLeadingWhitespaceAndNewlineCharacters", ^{
        [[[@"" stringByTrimmingLeadingWhitespaceAndNewlineCharacters] should] beEmpty];
        [[[@"\n " stringByTrimmingLeadingWhitespaceAndNewlineCharacters] should] beEmpty];
        [[[@"\n hello \n" stringByTrimmingLeadingWhitespaceAndNewlineCharacters] should]
         equal:@"hello \n"];
    });
    
    specify(@"-stringByTrimmingTrailingCharactersInSet", ^{
        NSCharacterSet *letterCharSet = [NSCharacterSet letterCharacterSet];
        [[[@"zip90210zip" stringByTrimmingTrailingCharactersInSet:letterCharSet] should]
         equal:@"zip90210"];
    });
        
    specify(@"-stringByTrimmingTrailingWhitespaceAndNewlineCharacters", ^{
        [[[@"" stringByTrimmingTrailingWhitespaceAndNewlineCharacters] should] beEmpty];
        [[[@"\n " stringByTrimmingTrailingWhitespaceAndNewlineCharacters] should] beEmpty];
        [[[@"\n hello \n" stringByTrimmingTrailingWhitespaceAndNewlineCharacters] should]
         equal:@"\n hello"];
    });
});

SPEC_END
