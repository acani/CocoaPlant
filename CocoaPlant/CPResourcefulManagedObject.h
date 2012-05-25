#import <CoreData/CoreData.h>

@interface CPResourcefulManagedObject : NSManagedObject

+ (id)updateOrInsertWithDictionary:(NSDictionary *)dictionary
                     attributeName:(NSString *)attributeName
                     dictionaryKey:(NSString *)dictionaryKey
            inManagedObjectContext:(NSManagedObjectContext *)context;

+ (void)updateAllWithArray:(NSArray *)servedDictionaries
             dictionaryKey:(NSString *)dictionaryKey
             attributeName:(NSString *)attributeName
      managedObjectContext:(NSManagedObjectContext *)context;

+ (NSArray *)relationshipKeyPathsForUpdating;

- (BOOL)updateWithDictionary:(NSDictionary *)dictionary;

@end
