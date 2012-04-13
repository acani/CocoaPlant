#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

typedef void (^NSFetchRequestOptions)(NSFetchRequest *request);

NS_INLINE NSFetchRequest *NSFetchRequestMake(NSString *entityName,
                                             NSManagedObjectContext *managedObjectContext);
NS_INLINE NSFetchRequest *NSFetchRequestMake(NSString *entityName,
                                             NSManagedObjectContext *managedObjectContext) {
#if __IPHONE_OS_VERSION_MIN_REQUIRED < __IPHONE_5_0 // iOS Deployment Target
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    fetchRequest.entity = [NSEntityDescription entityForName:entityName
                                      inManagedObjectContext:managedObjectContext];
    return fetchRequest;
#else
    return [NSFetchRequest fetchRequestWithEntityName:entityName];
#endif
}

@interface NSManagedObject (CocoaPlant)

+ (NSEntityDescription *)entityInManagedObjectContext:(NSManagedObjectContext *)context;
+ (id)insertIntoManagedObjectContext:(NSManagedObjectContext *)context;

+ (NSArray *)fetchInManagedObjectContext:(NSManagedObjectContext *)context error:(NSError **)error options:(NSFetchRequestOptions)options;
+ (id)fetchFirstInManagedObjectContext:(NSManagedObjectContext *)context error:(NSError **)error options:(NSFetchRequestOptions)options;

+ (BOOL)deleteAllInManagedObjectContext:(NSManagedObjectContext *)context error:(NSError **)error;
- (void)delete;

// TODO: handle errors:
//+ (void) defaultErrorHandler:(NSError *)error
//{
//    NSDictionary *userInfo = [error userInfo];
//    for (NSArray *detailedError in [userInfo allValues])
//    {
//        if ([detailedError isKindOfClass:[NSArray class]])
//        {
//            for (NSError *e in detailedError)
//            {
//                if ([e respondsToSelector:@selector(userInfo)])
//                {
//                    ARLog(@"Error Details: %@", [e userInfo]);
//                }
//                else
//                {
//                    ARLog(@"Error Details: %@", e);
//                }
//            }
//        }
//        else
//        {
//            ARLog(@"Error: %@", detailedError);
//        }
//    }
//    ARLog(@"Error Domain: %@", [error domain]);
//    ARLog(@"Recovery Suggestion: %@", [error localizedRecoverySuggestion]);
//}

@end
