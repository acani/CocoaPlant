#import <SenTestingKit/SenTestingKit.h>

#import "UITextField+CocoaPlant.h"

@interface UITextField_CocoaPlantTests : SenTestCase {
    UITextField *textField;
}
@end

@implementation UITextField_CocoaPlantTests

- (void)setUp {
    textField = [[UITextField alloc] initWithFrame:CGRectMake(0.0, 0.0, 0.0, 0.0)];
}

- (void)tearDown {
    textField = nil;
}

- (void)testHasText {
    // hasText => NO
    STAssertFalse([textField hasText], @"nil isn't text.");
    textField.text = @"";
    STAssertFalse([textField hasText], @"empty string isn't text.");

    // hasText => YES
    textField.text = @"\u200B";
    STAssertTrue([textField hasText], @"\u200B is text.");
    textField.text = @"has text";
    STAssertTrue([textField hasText], @"any text is text.");
}

@end
