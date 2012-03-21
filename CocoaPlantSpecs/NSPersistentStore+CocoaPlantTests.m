#import <SenTestingKit/SenTestingKit.h>

@interface NSPersistentStore_CocoaPlantTests : SenTestCase
@end

#import "NSPersistentStore+CocoaPlant.h"
#import "NSBundle+CocoaPlant.h"
#import "NSFileManager+CocoaPlant.h"

@implementation NSPersistentStore_CocoaPlantTests

#pragma mark defaultURL

- (void)testDefaultURLExists {
    STAssertNotNil([NSPersistentStore defaultURL], @"default URL exists");
}

- (void)testDefaultURLIsCorrect {
    NSString *appName = [[NSBundle mainBundle] name];
    NSString *sqliteFilename = [[NSString alloc] initWithFormat:@"%@.sqlite", appName];
    NSURL *storeURL = [[[NSFileManager defaultManager] URLForApplicationDocumentDirectory]
                       URLByAppendingPathComponent:sqliteFilename];
    STAssertEqualObjects([NSPersistentStore defaultURL], storeURL, @"returns default URL");
}

@end
