//#import <Kiwi/Kiwi.h>
//#import <CoreData/CoreData.h>
//
//#import "NSManagedObjectContext+CocoaPlant.h"
//#import "NSPersistentStoreCoordinator+CocoaPlant.h"
//
//SPEC_BEGIN(NSManagedObjectContext_CocoaPlantSpecs)
//
//describe(@"NSManagedObjectContext+CocoaPlant", ^{
//    __block NSManagedObjectContext *context;
//
//    describe(@"+contextWithStoreType:error:", ^{
//        it(@"passes arguments", ^{
//            NSString *storeType = NSSQLiteStoreType;
//            NSError __autoreleasing *error;
//            [[NSPersistentStoreCoordinator should] receive:@selector(coordinatorWithStoreType:error:)
//             withArguments:storeType, theValue(&error)];
//            context = [NSManagedObjectContext contextWithStoreType:storeType error:&error];
//
//        });
//
////
////        it(@"sets coordinator", ^{
////            [NSPersistentStoreCoordinator should] receive:@selector(coordinatorWithStoreType:error:) andReturn:<#(id)#> withArguments:<#(id), ...#>
////        });
////
////        it(@"returns something", ^{
////            context = [NSManagedObjectContext contextWithStoreType:NSSQLiteStoreType error:NULL];
////            [context shouldNotBeNil];
////        });
////
////        it(@"sets coordinator", ^{
////            context = [NSManagedObjectContext contextWithStoreType:NSSQLiteStoreType error:NULL];
////            [context.persistentStoreCoordinator shouldNotBeNil];
////        });
//    });
//});
//
//SPEC_END
//
////
////@interface NSManagedObjectContext_CocoaPlantSpecs : SenTestCase {
////    NSManagedObjectContext *context;
////}
////
////@end
////
////#import "NSManagedObjectContext+CocoaPlant.h"
////#import "NSPersistentStoreCoordinator+CocoaPlant.h"
////
////@implementation NSManagedObjectContext_CocoaPlantSpecs
////
////#pragma mark contextWithStoreType:error:
////
////- (void)testContextWithStoreTypeSQLiteExists {
////    context = [NSManagedObjectContext contextWithStoreType:NSSQLiteStoreType error:NULL];
////    STAssertNotNil(context, @"context with store type SQLite exists");
////}
////
////- (void)testContextWithStoreTypeSQLiteSetsCoordinator {
////    context = [NSManagedObjectContext contextWithStoreType:NSSQLiteStoreType error:NULL];
////    STAssertNotNil(context.persistentStoreCoordinator, @"sets coordinator with store type SQLite");
////}
////
////- (void)testContextWithStoreTypeInMemoryExists {
////    context = [NSManagedObjectContext contextWithStoreType:NSInMemoryStoreType error:NULL];
////    STAssertNotNil(context, @"context with store type InMemory exists");
////}
////
////- (void)testContextWithStoreTypeInMemorySetsCoordinator {
////    context = [NSManagedObjectContext contextWithStoreType:NSInMemoryStoreType error:NULL];
////    STAssertNotNil(context.persistentStoreCoordinator, @"sets coordinator with store type InMemory");
////}
////
////@end
