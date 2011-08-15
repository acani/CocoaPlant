#import <SenTestingKit/SenTestingKit.h>
#import <CoreData/CoreData.h>

@interface NSManagedObject_CocoaPlantSpecs : SenTestCase {
    NSManagedObjectContext *context;
}

@end

#import "NSManagedObject+CocoaPlant.h"
#import "NSManagedObjectContext+CocoaPlant.h"
#import "Event.h"

@implementation NSManagedObject_CocoaPlantSpecs

- (void)setUp {
    [super setUp];
    context = [NSManagedObjectContext contextWithStoreType:NSInMemoryStoreType error:NULL];
}

#pragma mark entityName

- (void)testEntityNameExists {
    STAssertNotNil([NSManagedObject entityName], @"entity name exists");
}

- (void)testEntityNameIsCorrect {
    STAssertEqualObjects([Event entityName], @"Event", @"entity name is correct");
}

#pragma mark insertIntoContext

- (void)testInsertIntoContextExists {
    STAssertNotNil([Event insertIntoContext:context], @"event object exists");
}

- (void)testInsertIntoContextIsCorrect {
    NSString *entityName = [[Event insertIntoContext:context] entity].name;
    STAssertEqualObjects(entityName, @"Event", @"event object is correct");
}

#pragma mark entityInContext

- (void)testEntityInContextExists {
    STAssertNotNil([Event entityInContext:context], @"event entity exists");
}

- (void)testEntityInContextIsCorrect {
    NSString *entityName = [Event entityInContext:context].name;
    STAssertEqualObjects(entityName, @"Event", @"event entity is correct");
}

#pragma mark fetchInContext:error:options

- (void)testFetchInContextWorks {
    STAssertNotNil([Event fetchInContext:context error:NULL options:NULL], @"fetch works");
}

- (void)testFetchInContextExists {
    [Event insertIntoContext:context];
    NSArray *results = [Event fetchInContext:context error:NULL options:NULL];
    STAssertEquals([results count], (NSUInteger)1, @"event exists");
}

- (void)testFetchInContextIsCorrect {
    Event *event = [Event insertIntoContext:context];
    Event *fetchedEvent = [[Event fetchInContext:context error:NULL options:NULL] objectAtIndex:0];
    STAssertEqualObjects(event, fetchedEvent, @"event is correct");
}

- (void)testFetchInContextWithOptions {
    [Event insertIntoContext:context];
    [Event insertIntoContext:context];

    NSArray *results = [Event fetchInContext:context error:NULL options:^(NSFetchRequest *request) {
        [request setFetchLimit:1];
    }];

    STAssertEquals([results count], (NSUInteger)1, @"applies fetch options");
}

@end
