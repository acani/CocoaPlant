#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

typedef void (^NSFetchRequestOptions)(NSFetchRequest *request);

@interface NSManagedObject (CocoaPlant)

+ (NSString *)entityName;
+ (NSEntityDescription *)entityInManagedObjectContext:(NSManagedObjectContext *)context;
+ (id)insertIntoManagedObjectContext:(NSManagedObjectContext *)context;

+ (NSFetchRequest *)fetchRequestInManagedObjectContext:(NSManagedObjectContext *)context;
+ (NSArray *)fetchInManagedObjectContext:(NSManagedObjectContext *)context error:(NSError **)error
                    options:(NSFetchRequestOptions)options;
+ (BOOL)deleteAllInManagedObjectContext:(NSManagedObjectContext *)context error:(NSError **)error;


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
