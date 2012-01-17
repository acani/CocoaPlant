#import <SenTestingKit/SenTestingKit.h>
#import <CoreData/CoreData.h>

@interface NSPersistentStoreCoordinator_CocoaPlantTests : SenTestCase {
    NSPersistentStoreCoordinator *coordinator;
}

@end

#import "NSManagedObjectModel+CocoaPlant.h"
#import "NSPersistentStore+CocoaPlant.h"
#import "NSPersistentStoreCoordinator+CocoaPlant.h"

@implementation NSPersistentStoreCoordinator_CocoaPlantTests

- (void)setUp {
    [super setUp];
    coordinator = [NSPersistentStoreCoordinator coordinatorWithDefaultModel];
}

- (void)tearDown {
    [[[NSFileManager alloc] init] removeItemAtURL:[NSPersistentStore defaultURL] error:NULL];
    [super tearDown];
}

#pragma mark coordinatorWithDefaultModel

- (void)testCoordinatorWithDefaultModelExists {
    STAssertNotNil(coordinator, @"coordinator exists");
}

#pragma mark coordinatorWithStoreType:error:

- (void)testCoordinatorWithStoreTypeSQLiteExists {
    coordinator = [NSPersistentStoreCoordinator coordinatorWithStoreType:NSSQLiteStoreType
                                                                   error:NULL];
    STAssertNotNil(coordinator, @"coordinator with store type SQLite exists");
}

- (void)testCoordinatorWithStoreTypeInMemoryExists {
    coordinator = [NSPersistentStoreCoordinator coordinatorWithStoreType:NSInMemoryStoreType
                                                                   error:NULL];
    STAssertNotNil(coordinator, @"coordinator with store type InMemory exists");
}

#pragma mark addStoreWithType:error:

- (void)testAddStoreWithTypeSQLiteReturnsAddedStore {
    STAssertNotNil([coordinator addStoreWithType:NSSQLiteStoreType error:NULL],
                   @"returns added store of type SQLite");
}

- (void)testAddStoreWithTypeSQLiteAddsStore {
    [coordinator addStoreWithType:NSSQLiteStoreType error:NULL];
    NSString *storeType = [(NSPersistentStore *)[coordinator.persistentStores lastObject] type];
    STAssertEqualObjects(storeType, NSSQLiteStoreType, @"adds store of type SQLite");
}

- (void)testAddStoreWithTypeInMemoryReturnsAddedStore {
    STAssertNotNil([coordinator addStoreWithType:NSInMemoryStoreType error:NULL],
                   @"returns added store of type InMemory");
}

- (void)testAddStoreWithTypeInMemoryAddsStore {
    [coordinator addStoreWithType:NSInMemoryStoreType error:NULL];
    NSString *storeType = [(NSPersistentStore *)[coordinator.persistentStores lastObject] type];
    STAssertEqualObjects(storeType, NSInMemoryStoreType, @"adds store of type InMemory");
}

@end
