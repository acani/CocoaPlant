#import <SenTestingKit/SenTestingKit.h>
#import "CPResourcefulManagedObject.h"
#import "NSManagedObject+CocoaPlant.h"
#import "Task.h"

@interface CPResourcefulManagedObjectTests : SenTestCase {
    NSManagedObjectContext *managedObjectContext;
}
@end

@implementation CPResourcefulManagedObjectTests

#define TaskOldName1 @"Relax."
#define TaskOldName2 @"Take a deep breath."
#define TaskOldName3 @"Get jiggy with it."

#define TaskNewName1 @"Flow."
#define TaskNewName2 @"Let it be."
#define TaskNewName3 @"Do it live!"
#define TaskNewName4 @"Yeah, baby!"
#define TaskNewName5 @"Nice!"

- (void)setUp {
    managedObjectContext = [NSManagedObjectContext contextWithStoreType:NSInMemoryStoreType
                                                                  error:NULL];
    
}

- (void)tearDown {
    managedObjectContext = nil;
}

- (void)testUpdateAllWithArray_insertNone {    
    [Task updateAllWithArray:[NSArray array] dictionaryKey:@"id" attributeName:@"resourceID"
        managedObjectContext:managedObjectContext];

    NSArray *allTasks = [self fetchAllTasks];
    
    STAssertEquals([allTasks count], (NSUInteger)0, @"0 tasks should exist.");
}

- (void)testUpdateAllWithArray_insertNone_nonEmpty {
    [self insertTasks];

    [Task updateAllWithArray:[NSArray array] dictionaryKey:@"id" attributeName:@"resourceID"
        managedObjectContext:managedObjectContext];
    
    NSArray *allTasks = [self fetchAllTasks];
    
    STAssertEquals([allTasks count], (NSUInteger)3, @"3 tasks should exist.");
    
    NSArray *expectedResourceIDs = [NSArray arrayWithObjects:@"1", @"2", @"3", nil];
    NSArray *expectedNames = [NSArray arrayWithObjects:TaskOldName1, TaskOldName2, TaskOldName3, nil];
    NSUInteger idx = 0;
    for (Task *task in allTasks) {
        STAssertEqualObjects(task.resourceID, [expectedResourceIDs objectAtIndex:idx],
                             @"task.resouceID should stay the same.");
        STAssertEqualObjects(task.name, [expectedNames objectAtIndex:idx],
                             @"task.name should be correct.");
        ++idx;
    }
}

- (void)testUpdateAllWithArray_insertAll {
    NSArray *servedDictionaries =
    [NSArray arrayWithObjects:
     [NSDictionary dictionaryWithObjectsAndKeys:@"1", @"id", TaskNewName1, @"name", nil],
     [NSDictionary dictionaryWithObjectsAndKeys:@"2", @"id", TaskNewName2, @"name", nil], nil];
    
    // Reverse the servedDictionaries order 50% of the time.
    if (arc4random_uniform(2)) {
        servedDictionaries = [servedDictionaries sortedArrayUsingDescriptors:
                              NSSortDescriptors1(@"id", NO)];
    }

    [Task updateAllWithArray:servedDictionaries dictionaryKey:@"id" attributeName:@"resourceID"
        managedObjectContext:managedObjectContext];

    NSArray *allTasks = [self fetchAllTasks];
    
    STAssertEquals([allTasks count], (NSUInteger)2, @"2 tasks should exist.");

    NSArray *expectedResourceIDs = [NSArray arrayWithObjects:@"1", @"2", nil];
    NSArray *expectedNames = [NSArray arrayWithObjects:TaskNewName1, TaskNewName2, nil];
    NSUInteger idx = 0;
    for (Task *task in allTasks) {
        STAssertEqualObjects(task.resourceID, [expectedResourceIDs objectAtIndex:idx],
                             @"task.resouceID should stay the same.");
        STAssertEqualObjects(task.name, [expectedNames objectAtIndex:idx],
                             @"task.name should be correct.");
        ++idx;
    }
}

- (void)testUpdateAllWithArray_updateSome {
    NSArray *servedDictionaries =
    [NSArray arrayWithObjects:
     [NSDictionary dictionaryWithObjectsAndKeys:@"1", @"id", TaskNewName1, @"name", nil],
     [NSDictionary dictionaryWithObjectsAndKeys:@"2", @"id", TaskNewName2, @"name", nil], nil];
    
    // Reverse the servedDictionaries order 50% of the time.
    if (arc4random_uniform(2)) {
        servedDictionaries = [servedDictionaries sortedArrayUsingDescriptors:
                              NSSortDescriptors1(@"id", NO)];
    }

    [self insertTasks];

    [Task updateAllWithArray:servedDictionaries dictionaryKey:@"id" attributeName:@"resourceID"
        managedObjectContext:managedObjectContext];
    
    NSArray *allTasks = [self fetchAllTasks];
    
    STAssertEquals([allTasks count], (NSUInteger)3, @"3 tasks should exist.");
    
    NSArray *expectedResourceIDs = [NSArray arrayWithObjects:@"1", @"2", @"3", nil];
    NSArray *expectedNames = [NSArray arrayWithObjects:TaskNewName1, TaskNewName2, TaskOldName3, nil];
    NSUInteger idx = 0;
    for (Task *task in allTasks) {
        STAssertEqualObjects(task.resourceID, [expectedResourceIDs objectAtIndex:idx],
                             @"task.resouceID should stay the same.");
        STAssertEqualObjects(task.name, [expectedNames objectAtIndex:idx],
                             @"task.name should be correct.");
        ++idx;
    }
}

- (void)testUpdateAllWithArray_updateAll {
    NSArray *servedDictionaries =
    [NSArray arrayWithObjects:
     [NSDictionary dictionaryWithObjectsAndKeys:@"1", @"id", TaskNewName1, @"name", nil],
     [NSDictionary dictionaryWithObjectsAndKeys:@"2", @"id", TaskNewName2, @"name", nil],
     [NSDictionary dictionaryWithObjectsAndKeys:@"3", @"id", TaskNewName3, @"name", nil], nil];

    // Reverse the servedDictionaries order 50% of the time.
    if (arc4random_uniform(2)) {
        servedDictionaries = [servedDictionaries sortedArrayUsingDescriptors:
                              NSSortDescriptors1(@"id", NO)];
    }
    
    [self insertTasks];
    
    [Task updateAllWithArray:servedDictionaries dictionaryKey:@"id" attributeName:@"resourceID"
        managedObjectContext:managedObjectContext];
    
    NSArray *allTasks = [self fetchAllTasks];
    
    STAssertEquals([allTasks count], (NSUInteger)3, @"3 tasks should exist.");
    
    NSArray *expectedResourceIDs = [NSArray arrayWithObjects:@"1", @"2", @"3", nil];
    NSArray *expectedNames = [NSArray arrayWithObjects:TaskNewName1, TaskNewName2, TaskNewName3, nil];
    NSUInteger idx = 0;
    for (Task *task in allTasks) {
        STAssertEqualObjects(task.resourceID, [expectedResourceIDs objectAtIndex:idx],
                             @"task.resouceID should stay the same.");
        STAssertEqualObjects(task.name, [expectedNames objectAtIndex:idx],
                             @"task.name should be correct.");
        ++idx;
    }
}

- (void)testUpdateAllWithArray_updateAll_insertSome {
    NSArray *servedDictionaries =
    [NSArray arrayWithObjects:
     [NSDictionary dictionaryWithObjectsAndKeys:@"1", @"id", TaskNewName1, @"name", nil],
     [NSDictionary dictionaryWithObjectsAndKeys:@"2", @"id", TaskNewName2, @"name", nil],
     [NSDictionary dictionaryWithObjectsAndKeys:@"3", @"id", TaskNewName3, @"name", nil],
     [NSDictionary dictionaryWithObjectsAndKeys:@"4", @"id", TaskNewName4, @"name", nil],
     [NSDictionary dictionaryWithObjectsAndKeys:@"5", @"id", TaskNewName5, @"name", nil], nil];
    
    // Reverse the servedDictionaries order 50% of the time.
    if (arc4random_uniform(2)) {
        servedDictionaries = [servedDictionaries sortedArrayUsingDescriptors:
                              NSSortDescriptors1(@"id", NO)];
    }
    
    [self insertTasks];
    
    [Task updateAllWithArray:servedDictionaries dictionaryKey:@"id" attributeName:@"resourceID"
        managedObjectContext:managedObjectContext];
    
    NSArray *allTasks = [self fetchAllTasks];
    
    STAssertEquals([allTasks count], (NSUInteger)5, @"5 tasks should exist.");

    NSArray *expectedResourceIDs = [NSArray arrayWithObjects:@"1", @"2", @"3", @"4", @"5", nil];
    NSArray *expectedNames = [NSArray arrayWithObjects:TaskNewName1, TaskNewName2, TaskNewName3,
                              TaskNewName4, TaskNewName5, nil];
    NSUInteger idx = 0;
    for (Task *task in allTasks) {
        STAssertEqualObjects(task.resourceID, [expectedResourceIDs objectAtIndex:idx],
                             @"task.resouceID should stay the same.");
        STAssertEqualObjects(task.name, [expectedNames objectAtIndex:idx],
                             @"task.name should be correct.");
        ++idx;
    }
}

- (void)testUpdateAllWithArray_updateSome_insertSome {
    NSArray *servedDictionaries =
    [NSArray arrayWithObjects:
     [NSDictionary dictionaryWithObjectsAndKeys:@"1", @"id", TaskNewName1, @"name", nil],
     [NSDictionary dictionaryWithObjectsAndKeys:@"3", @"id", TaskNewName3, @"name", nil],
     [NSDictionary dictionaryWithObjectsAndKeys:@"4", @"id", TaskNewName4, @"name", nil],
     [NSDictionary dictionaryWithObjectsAndKeys:@"5", @"id", TaskNewName5, @"name", nil], nil];
    
    // Reverse the servedDictionaries order 50% of the time.
    if (arc4random_uniform(2)) {
        servedDictionaries = [servedDictionaries sortedArrayUsingDescriptors:
                              NSSortDescriptors1(@"id", NO)];
    }
    
    [self insertTasks];
    
    [Task updateAllWithArray:servedDictionaries dictionaryKey:@"id" attributeName:@"resourceID"
        managedObjectContext:managedObjectContext];
    
    NSArray *allTasks = [self fetchAllTasks];
    
    STAssertEquals([allTasks count], (NSUInteger)5, @"5 tasks should exist.");
    
    NSArray *expectedResourceIDs = [NSArray arrayWithObjects:@"1", @"2", @"3", @"4", @"5", nil];
    NSArray *expectedNames = [NSArray arrayWithObjects:TaskNewName1, TaskOldName2, TaskNewName3,
                              TaskNewName4, TaskNewName5, nil];
    NSUInteger idx = 0;
    for (Task *task in allTasks) {
        STAssertEqualObjects(task.resourceID, [expectedResourceIDs objectAtIndex:idx],
                             @"task.resouceID should stay the same.");
        STAssertEqualObjects(task.name, [expectedNames objectAtIndex:idx],
                             @"task.name should be correct.");
        ++idx;
    }
}

- (void)insertTasks {
    Task *task1 = [Task insertIntoManagedObjectContext:managedObjectContext];
    task1.resourceID = @"1";
    task1.name = TaskOldName1;
    
    Task *task2 = [Task insertIntoManagedObjectContext:managedObjectContext];
    task2.resourceID = @"2";
    task2.name = TaskOldName2;
    
    Task *task3 = [Task insertIntoManagedObjectContext:managedObjectContext];
    task3.resourceID = @"3";
    task3.name = TaskOldName3;
}

- (NSArray *)fetchAllTasks {
    NSFetchRequest *fetchRequest = NSFetchRequestMake(@"Task", managedObjectContext);
    fetchRequest.returnsObjectsAsFaults = NO;
    fetchRequest.sortDescriptors = NSSortDescriptors1(@"resourceID", YES);
    return MOCFetch(managedObjectContext, fetchRequest);
}

@end
