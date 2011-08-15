#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface NSManagedObject (CocoaPlant)

+ (NSString *)entityName;
+ (id)insertIntoContext:(NSManagedObjectContext *)context;
+ (NSEntityDescription *)entityInContext:(NSManagedObjectContext *)context;

+ (NSArray *)fetchInContext:(NSManagedObjectContext *)context error:(NSError **)error
                    options:(void (^)(NSFetchRequest *request))options;

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
