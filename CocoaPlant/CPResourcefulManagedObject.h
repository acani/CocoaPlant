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

+ (NSArray *)relationshipKeyPathsForUpdating;

- (BOOL)updateWithDictionary:(NSDictionary *)dictionary;

@end
