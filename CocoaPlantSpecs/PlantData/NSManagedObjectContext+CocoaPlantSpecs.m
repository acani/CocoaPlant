#import <SenTestingKit/SenTestingKit.h>
#import <CoreData/CoreData.h>

@interface NSManagedObjectContext_CocoaPlantSpecs : SenTestCase {
    NSManagedObjectContext *context;
}

@end

#import "NSManagedObjectContext+CocoaPlant.h"
#import "NSPersistentStoreCoordinator+CocoaPlant.h"

@implementation NSManagedObjectContext_CocoaPlantSpecs

#pragma mark contextWithStoreType:error:

- (void)testContextWithStoreTypeSQLiteExists {
    context = [NSManagedObjectContext contextWithStoreType:NSSQLiteStoreType error:NULL];
    STAssertNotNil(context, @"context with store type SQLite exists");
}

- (void)testContextWithStoreTypeSQLiteSetsCoordinator {
    context = [NSManagedObjectContext contextWithStoreType:NSSQLiteStoreType error:NULL];
    STAssertNotNil(context.persistentStoreCoordinator, @"sets coordinator with store type SQLite");
}

- (void)testContextWithStoreTypeInMemoryExists {
    context = [NSManagedObjectContext contextWithStoreType:NSInMemoryStoreType error:NULL];
    STAssertNotNil(context, @"context with store type InMemory exists");
}

- (void)testContextWithStoreTypeInMemorySetsCoordinator {
    context = [NSManagedObjectContext contextWithStoreType:NSInMemoryStoreType error:NULL];
    STAssertNotNil(context.persistentStoreCoordinator, @"sets coordinator with store type InMemory");
}

@end
