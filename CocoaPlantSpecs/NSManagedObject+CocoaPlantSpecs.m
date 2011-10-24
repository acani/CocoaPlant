#import <Kiwi/Kiwi.h>
#import <CoreData/CoreData.h>

#import "NSManagedObject+CocoaPlant.h"
#import "NSManagedObjectContext+CocoaPlant.h"
#import "Event.h"

SPEC_BEGIN(NSManagedObject_CocoaPlantSpecs)

describe(@"NSManagedObject+CocoaPlant", ^{
    __block NSManagedObjectContext *context;

    beforeEach(^{
        context = [NSManagedObjectContext contextWithStoreType:NSInMemoryStoreType error:NULL];
    });

    describe(@"-entityName", ^{
        it(@"returns something", ^{ [[Event entityName] shouldNotBeNil]; });
        it(@"returns enity name", ^{ [[[Event entityName] should] equal:@"Event"]; });
    });

    describe(@"-entityInManagedObjectContext", ^{
        it(@"returns something", ^{ [[Event entityInManagedObjectContext:context] shouldNotBeNil]; });
        
        it(@"returns entity", ^{
            NSString *entityName = [Event entityInManagedObjectContext:context].name;
            [[entityName should] equal:@"Event"];
        });
    });

    describe(@"-insertIntoManagedObjectContext", ^{
        it(@"returns something", ^{ [[Event insertIntoManagedObjectContext:context] shouldNotBeNil]; });

        it(@"returns inserted entity", ^{
            NSString *entityName = [[Event insertIntoManagedObjectContext:context] entity].name;
            [[entityName should] equal:@"Event"];
        });

        it(@"inserts object into context", ^{
            Event *event = [Event insertIntoManagedObjectContext:context];
            [[context objectRegisteredForID:[event objectID]] shouldNotBeNil];
        });
    });

    describe(@"-fetchInManagedObjectContext:error:options", ^{
        it(@"returns 0 objects", ^{
            NSArray *results = [Event fetchInManagedObjectContext:context error:NULL options:NULL];
            [[theValue([results count]) should] equal:theValue(0)];
        });
        
        it(@"returns 1 object", ^{
            [Event insertIntoManagedObjectContext:context];
            NSArray *results = [Event fetchInManagedObjectContext:context error:NULL options:NULL];
            [[theValue([results count]) should] equal:theValue(1)];
        });

        it(@"returns fetched objects", ^{
            NSArray *events = [NSArray arrayWithObject:[Event insertIntoManagedObjectContext:context]];
            NSArray *fetchedEvents = [Event fetchInManagedObjectContext:context error:NULL options:NULL];
            [[events should] equal:fetchedEvents];
        });

        it(@"applies fetch options", ^{
            [Event insertIntoManagedObjectContext:context];
            [Event insertIntoManagedObjectContext:context];
            
            NSArray *results = [Event fetchInManagedObjectContext:context error:NULL options:^(NSFetchRequest *request) {
                [request setFetchLimit:1];
            }];
            
            [[theValue([results count]) should] equal:theValue(1)];
        });
    });
});

SPEC_END
