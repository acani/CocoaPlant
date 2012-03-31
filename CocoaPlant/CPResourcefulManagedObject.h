#import <CoreData/CoreData.h>

@interface CPResourcefulManagedObject : NSManagedObject

+ (id)updateOrInsertWithDictionary:(NSDictionary *)dictionary
                     dictionaryKey:(NSString *)dictionaryKey
                     attributeName:(NSString *)attributeName
            inManagedObjectContext:(NSManagedObjectContext *)context;

+ (void)updateAllWithArray:(NSArray *)servedDictionaries
                   keyPath:(NSString *)keyPath
             attributeName:(NSString *)attributeName
             dictionaryKey:(NSString *)dictionaryKey
      managedObjectContext:(NSManagedObjectContext *)context;

+ (void)updateAllWithArray:(NSArray *)servedDictionaries
                   keyPath:(NSString *)keyPath
             attributeName:(NSString *)attributeName
      relationshipKeyPaths:(NSArray *)relationshipKeyPaths
             dictionaryKey:(NSString *)dictionaryKey
      managedObjectContext:(NSManagedObjectContext *)context;

- (BOOL)updateWithDictionary:(NSDictionary *)dictionary;

@end
