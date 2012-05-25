#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import <CocoaPlant/CocoaPlant.h>

@interface Task : CPResourcefulManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * resourceID;

@end
