#import <CoreData/CoreData.h>

@interface CPResourcefulManagedObject : NSManagedObject

+ (void)updateAllWithArray:(NSArray *)servedDictionaries
                   keyPath:(NSString *)keyPath
             attributeName:(NSString *)attributeName
             dictionaryKey:(NSString *)dictionaryKey
      managedObjectContext:(NSManagedObjectContext *)context;

- (BOOL)updateWithDictionary:(NSDictionary *)dictionary;

@end
