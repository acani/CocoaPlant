#import <SenTestingKit/SenTestingKit.h>

@interface NSManagedObjectModel_CocoaPlantSpecs : SenTestCase
@end

#import "NSManagedObjectModel+CocoaPlant.h"
#import "NSBundle+CocoaPlant.h"

@implementation NSManagedObjectModel_CocoaPlantSpecs

#pragma mark modelWithDefaultURL

- (void)testModelWithDefaultURLExists {
    STAssertNotNil([NSManagedObjectModel modelWithDefaultURL], @"model with default URL exists");
}

#pragma mark defaultURL

- (void)testDefaultURLExists {
    STAssertNotNil([NSManagedObjectModel defaultURL], @"default URL exists");
}

- (void)testDefaultURLIsCorrect {
    NSString *appName = [[NSBundle mainBundle] name];
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:appName withExtension:@"momd"];
    STAssertEqualObjects([NSManagedObjectModel defaultURL], modelURL, @"default URL is correct");
}

@end
